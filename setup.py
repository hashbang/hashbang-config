#!/usr/bin/env python
from distutils.core import setup

setup(
    name='hashbangctl',
    version='0.2',
    scripts=[
        'bin/hashbangctl',
    ],
    data_files=[('/etc',['hashbangctl.example.conf'])],
    author='Hashbang Team',
    author_email='team@hashbang.sh',
    license='GPL 3.0',
    description='',
    long_description=open('README.md').read(),
    install_requires=[
        'provisor',
        'requests'
    ],
    dependency_links = [
        'git+https://github.com/hashbang/provisor/',
    ]
)
