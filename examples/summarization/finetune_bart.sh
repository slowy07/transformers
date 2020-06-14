export OUTPUT_DIR_NAME=bart_cnn_finetune
export OUTPUT_DIR=bart_cnn_finetune

# Make output directory if it doesn't exist
mkdir -p $OUTPUT_DIR

# Add parent directory to python path to access lightning_base.py
export PYTHONPATH="../":"${PYTHONPATH}"

python -m pdb -c continue finetune.py \
--data_dir=$CNN_DIR \
--model_name_or_path=facebook/bart-large \
--learning_rate=3e-5 \
--train_batch_size=4 \
--eval_batch_size=4 \
--output_dir=$OUTPUT_DIR \
--do_train \
--do_predict \
--n_val 1000 \
--val_check_interval 0.1 \
--sortish_sampler \
--num_train_epochs 6 \
$@
