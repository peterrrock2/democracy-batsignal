#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "$(realpath "${BASH_SOURCE[0]}")")

plan_name="8THGRADE_1"
n_steps=$((10 ** 5))
seed=42
tol=0.01
pop_col="TOT_POP"
json_dir="JSON_dualgraphs"
output_dir="chain_outputs"

# json_file="$(realpath ./${json_dir}/gerrymandria.json)"
json_file="$(realpath ./${json_dir}/PA.json)"
final_output_file="$(realpath ./${output_dir})/PA_chain_${n_steps}_steps.ben"

frcw \
    --assignment-col $plan_name \
    --graph-json $json_file \
    --n-steps $n_steps \
    --pop-col $pop_col \
    --rng-seed $seed \
    --tol $tol \
    --variant district-pairs-rmst \
    --writer ben \
    --batch-size 1 \
    --n-threads 1 \
    --output-file "${final_output_file}" \
    --overwrite-output \
    --show-progress
