#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "$(realpath "${BASH_SOURCE[0]}")")

n_steps=$((10 ** 5))
json_dir="JSON_dualgraphs"
chain_dir="chain_outputs"
stats_dir="$(realpath "$SCRIPT_DIR"/..)/stats"

mkdir -p "${stats_dir}"

# json_file="$(realpath ./${json_dir}/gerrymandria.json)"
json_file="$(realpath ./${json_dir}/PA.json)"
ben_file="$(realpath ./${chain_dir})/PA_chain_${n_steps}_steps_mkvchain.ben"

subdir="${stats_dir}/cut_edges"
mkdir -p "${subdir}"
ben-process \
    -g "${json_file}" \
    -b "${ben_file}" \
    --output-dir "${subdir}"

election_cols=(
    "PRES12R"
    "SEN10D"
    "SEN10R"
    "T16ATGD"
    "T16ATGR"
    "T16PRESD"
    "T16PRESR"
    "T16SEND"
    "T16SENR"
)

subdir="${stats_dir}/elections"
mkdir -p "${subdir}"
ben-process \
    -m tally-keys \
    -g "${json_file}" \
    -b "${ben_file}" \
    -k "${election_cols[@]}" \
    --output-dir "${subdir}"
