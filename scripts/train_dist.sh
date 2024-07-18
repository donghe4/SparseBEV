export CUDA_VISIBLE_DEVICES=0,1

torchrun --nproc_per_node 2 train.py --config configs/vov99_dd3d_1600x640_trainval_future.py

# torchrun --nproc_per_node 2 train.py --config configs/vit_eva02_1600x640_trainval_future.py

# torchrun --nproc_per_node 2 train.py --config configs/r50_nuimg_704x256.py