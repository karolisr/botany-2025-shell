#!/usr/bin/env bash

# Suppress printing of error messages
# exec 2>/dev/null

# Stop on first error
set -o errexit
# Set trap on ERR to be inherited by shell functions
set -o errtrace

# Trap errors
trap 'echo Error at line: $LINENO' ERR

if [[ $# -eq 0 ]] || [[ -z "${1}" ]] || [[ -z "${2}" ]]; then
    printf "\nUsage: run_spades_with_sample_list.sh sample_list_file output_directory\n"
    exit
fi

# Get sample paths
sample_list_file=${1}

if [[ ! -e "${sample_list_file}" ]] || [[ ! -f "${sample_list_file}" ]]; then
    printf "\nSample list file does not exist or the path is not a file.\n"
    exit
fi

# Output directories
output_directory=${2}

if [[ -e "${output_directory}" ]] && [[ ! -d "${output_directory}" ]]; then
    printf "\nOutput directory path is not a directory.\n"
    exit
fi

dir_out_working="${output_directory}/01-raw-spades-output"
dir_out_final="${output_directory}/02-assembly-fasta-files"

mkdir -p "${dir_out_working}"
mkdir -p "${dir_out_final}"

sample_paths=$(cat "${sample_list_file}")
mv "${sample_list_file}" "${sample_list_file}.SPADES_RUNNING"

pr1="_paired_1"
pr2="_paired_2"
ur1="_unpaired_1"
# ur2="_unpaired_2"

function join_by { local IFS="$1"; shift; echo "$*"; }

for sp in ${sample_paths}
do
    s=$(basename "${sp}")

    dir_out_working_sample="${dir_out_working}/${s}"

    if [[ -f "${dir_out_working_sample}/transcripts.fasta" ]]; then
        echo "Assembly for ${s} already exists."
        continue
    fi

    echo "Running SPAdes: ${s}"

    fq_left_array=$(ls -1 "${sp}"*${pr1}*)
    fq_rght_array=$(ls -1 "${sp}"*${pr2}*)
    fq_unpl_array=$(ls -1 "${sp}"*${ur1}*)
    # fq_unpr_array=$(ls -1 "${sp}"*${ur2}*)

    fq_left=$(join_by , "${fq_left_array[@]}")
    fq_rght=$(join_by , "${fq_rght_array[@]}")
    fq_unpl=$(join_by , "${fq_unpl_array[@]}")
    # fq_unpr=$(join_by , "${fq_unpr_array[@]}")

    echo "${fq_left}"
    echo "${fq_rght}"
    echo "${fq_unpl}"
    # echo "${fq_unpr}"

    rnaspades.py \
    -o "${dir_out_working_sample}" \
    --only-assembler \
    --threads 32 \
    --memory 400 \
    --phred-offset 33 \
    --pe-1 1 "${fq_left}" \
    --pe-2 1 "${fq_rght}" \
    --pe-s 1 "${fq_unpl}" \
    --pe-or 1 fr \
    --ss rf \

    # Assembled transcripts
    cp "${dir_out_working_sample}/transcripts.fasta" "${dir_out_final}/${s}.fasta"
    # Paths in the assembly graph corresponding to the transcripts
    cp "${dir_out_working_sample}/transcripts.paths" "${dir_out_final}/${s}.paths"
    # Hard filtered transcripts
    cp "${dir_out_working_sample}/hard_filtered_transcripts.fasta" "${dir_out_final}/${s}_hard_filtered.fasta"
    # Soft filtered transcripts
    cp "${dir_out_working_sample}/soft_filtered_transcripts.fasta" "${dir_out_final}/${s}_soft_filtered.fasta"
    # Assembly graph
    cp "${dir_out_working_sample}/assembly_graph.fastg" "${dir_out_final}/${s}_assembly_graph.fastg"
    # Assembly graph in GFA format
    cp "${dir_out_working_sample}/assembly_graph_with_scaffolds.gfa" "${dir_out_final}/${s}_assembly_graph_with_scaffolds.gfa"
    # Parameters
    cp "${dir_out_working_sample}/params.txt" "${dir_out_final}/${s}_params.txt"
    # Log
    cp "${dir_out_working_sample}/spades.log" "${dir_out_final}/${s}_spades.log"
done

mv "${sample_list_file}.SPADES_RUNNING" "${sample_list_file}.SPADES_DONE"
