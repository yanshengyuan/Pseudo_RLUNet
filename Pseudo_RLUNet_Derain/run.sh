python3 ./train.py --arch Uformer --gpu '0,1,2,3,4,5,6,7' --train_ps 128 --train_dir ../rainy_image_dataset/training --val_dir ../rainy_image_dataset/testing --embed_dim 16 --warmup --batch_size 96 --lr_initial 0.0009