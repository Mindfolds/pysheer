from setuptools import find_packages, setup

setup(
    name="pysheer",
    version="1.0.0",
    packages=find_packages(where="src"),
    package_dir={"": "src"},
    install_requires=["click>=8.0.0", "rich>=13.0.0"],
    entry_points={"console_scripts": ["pysheer=pysheer.cli:main"]},
)
