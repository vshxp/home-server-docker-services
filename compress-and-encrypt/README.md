# Compress and encrypt

Simple docker container to compress and encrypt folders

## Environment Variables 

Create a `.env` file with the password that you want for the .zip files.
```
COMPRESS_PASSWORD=your_password_here
```
>Note: leave it blank if you dont want encryption

## volumes
### input_dir
- Mount all folders inside the path `/input_dir/` all existing folders inside this one will be compressed and encrypted.
- You can mount as many volumes you want, but all must exists inside `/input_dir/`

ex.
considering this volumes:
```
- /data/files:/input_dir/files
- /home/user/documents:/input_dir/user/documents
- /home/shared_user/downloads:/input_dir/user/downloads
```
we will have this structure inside the container:
```
input_dir
├── files
└── user
    ├── documents
    └── downloads
```
For each folder in the first level will be created at `output_folder` of the container a .zip file with the content of it.

```
output_dir
├── files.zip
└── user.zip
```
