# Pseudo_RLUNet
An Image Restoration Network based on Self-Attention Feedback Connections

The AI Algorithm Proposed by Shengyuan Yan (not published). Pseudo_RLUNet is the primitive implementation and the crude version of RLUNet. The RLUNet proposed in my 
Master Thesis along with Ustormer is actually an Uformer with reversed residual links from decoders to encoders. But before I officially implement RLUNet I firstly carried out a precedent experiment, PseudoRLUNet. PseudoRLUNet's feedback connections are not real feedbacks but implemented by adding another Uformer after the existing Uformer and concatenate the features from the decoders of the first Uformer to the features of the encoders of the second Uformer. The cyclic working style of RLUNet is actually pseudo in PseudoRLUNet. However, PseudoRLUNet is still working fine!!!

Illustrations for the use of this repository:

1, data preparation

First download SIDD dataset for training on SIDD's official site. You will get a ZIP pack. Unzip all the files and preprocess the SIDD_Medium_sRGB with generate_patches.py to generate patches as the training images for Ustormer_Denoise, the recommended command is in below:

cat SIDD_Medium_Srgb_Parts.z* > combined.zip

unzip combined.zip

unzip val.zip

python3 generate_patches_SIDD.py --src_dir ../sidd/SIDD_Medium_Srgb/Data --tar_dir ../sidd/train

For the training of Ustormer_Derain, download Rain14000 dataset from official site. For the training of Ustormer_Deblur, download GoPro dataset from official site.

2, training

For Ustormer_Denoise:

python3 ./train.py --arch Uformer --gpu '0,2,4' --train_ps 128 --train_dir ../sidd/train --env 32_0705_1 --val_dir ../sidd/val --embed_dim 32 --warmup --batch_size 32 --lr_initial 0.0002

And similar commands for Ustormer_Derain as well as Ustormer_Deblur. You only need to change the path in --train_dir and --val_dir

3, test and pretrained models

My originally pretrained weights will not be supplied here. When you have finished your own training, use your .pth files and the test.py scripts in 3 branches of this repo respectively. Here we take Ustormer_Derain for example:

python ./test.py --arch Uformer --batch_size 1 --gpu '4' --input_dir ../5Deraining/Test1200 --result_dir ./results --weights ./log/Uformer32_0705_1/models/model_epoch_250.pth --embed_dim 32

If you want to use this repo for any academic or commercial purpose or if you have any questions to ask me please contact me in shengyuan_yan@163.com and for academic references please cite Ustormer as followings:

Shengyuan Yan. Research on an Image Restoration Method based on Window-based Channel-wise Local Self-attention Mechanism[M]. Wuhan University, China, 2022.

Thanks for your attention and starring
