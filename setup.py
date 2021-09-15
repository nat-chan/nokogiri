try:
    from setuptools import setup
except ImportError:
    from distutils.core import setup


setup(
    name='nokogiri',
    version='0.1.9',
    long_description=open('README.md').read(),
    long_description_content_type='text/markdown',
    packages=[
        'nokogiri',
        'tests',
    ],
)
