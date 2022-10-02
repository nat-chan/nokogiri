# nokogiri


This Python library is a sharp "nokogiri" that cuts through the problems that arise in the process of trial and error, such as machine learning.

```bash
pip install nokogiri
```

## [spylus](https://github.com/nat-chan/nokogiri/blob/main/notebook/test_spylus.ipynb)
- Now you can draw image with stylus pen or drawing tablet such as iPad, Surface and Wacom in JupyterLab/Notebook.
- Of course it senses pressure so you can control the thickness of the line.
- Clipboard image copy/paste feature supported! this is super effective for AI painting with clip studio/photoshop.
- VSCode greatly limits functionality due to policies that prohibit the execution of javascript in notebooks. Please use JupyterLab/Notebook.

### screenshot
![demo.gif](https://i.imgur.com/Jzxg3ah.gif)

### Try it

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/nat-chan/nokogiri/main?filepath=notebook/test_spylus.ipynb)
Hit this button and launch demo via binder.
- [launch demo via binder](https://mybinder.org/v2/gh/nat-chan/nokogiri/main?filepath=notebook/test_spylus.ipynb)
- [Just read usage on github](https://github.com/nat-chan/nokogiri/blob/main/notebook/test_spylus.ipynb)

```python
from nokogiri.spylus import spylus
```

--- 

## [anyparse](https://github.com/nat-chan/nokogiri/blob/main/nokogiri/anyparse.py)
Drop-in replacement library for (config)argparse that works anywhere (Jupyter Notebook, JupyterLab, VSCode Python Interactive).
Have you ever met an annying error message like this?
```
usage: ipykernel_launcher.py [-h]
ipykernel_launcher.py: error: unrecognized arguments: -f 
…
An exception has occurred, use %tb to see the full traceback.
SystemExit: 2
```

As shown in the following example. 
You can drop-in replace argparse with anyparse.
You can also specify commands to be parsed only on jupyter.

```
from nokogiri import anyparse as argparse # Drop-in replacement
parser = argparse.ArgumentParser()
parser.add_argument('--readlink', type=str, default="")
parser.add_argument('--metrics', type=bool, default=False)
parser.jupyter_argument("--metrics True") # This command is parsed only on jupyter.
args = parser.parse_args()
```

[If configargparse is already installed, all features are available!](https://github.com/bw2/ConfigArgParse)

## [working_dir](https://github.com/nat-chan/nokogiri/blob/main/nokogiri/working_dir.py)
Enables import of any module not in the project tree from anywhere at any time
```python
from nokogiri.working_dir import working_dir
with working_dir("/path/to/isolated_module"):
    import isolated_module
    with open("isolated_data") as f:
        isolated_data = f.read()
```

## [tqdm_load](https://github.com/nat-chan/nokogiri/blob/main/nokogiri/tqdm_load.py)
Display a progress bar while reading a pickle file
```python
from nokogiri.tqdm_load import tqdm_load
data = tqdm_load("/path/to/data.pkl")
```

## [defaultdotdict](https://github.com/nat-chan/nokogiri/blob/main/nokogiri/defaultdotdict.py)
defaultdict but also dotdict
```python
from nokogiri.defaultdotdict import defaultdotdict
sounds = defaultdotdict(lambda: "meow")
print(sounds.dog) # "meow"
sounds["dog"] = "bow" # you can also access with []
print(sounds.dog) # "bow"
```

## [curry](https://github.com/nat-chan/nokogiri/blob/main/nokogiri/curry.py)
currying function. add some syntax sugar for a lot of function arguments.
```python
from nokogiri.curry import curry
# "pipe" iterable objects
@curry
def f(x):
    return x+1
@curry
def g(x):
    return 2*x
range(5)|f|g # [2,4,6,8,10]

# example of common use case
@curry
def f(a="a", b="b", c="c", d="d"):
    return f"/{a}/{b}/{c}/{d}"
f.hoge.fuga.piyo("root") # "/root/hoge/fuga/piyo"

# syntax
f.hoge.fuga.piyo == lambda x: f(x, 'hoge', 'fuga', 'piyo')
f[1][None][True] == lambda x: f(x, 1, None, True)
f._(key="value") == lambda x: f(x, key="value")
```

## [which_env](https://github.com/nat-chan/nokogiri/blob/main/nokogiri/which_env.py)
Detect notebook environment is Jupyter or Terminal or …
```python
from nokogiri.which_env import which_env
if which_env() == which_env.JUPYTER:
    from tqdm.notebook import tqdm
else:
    from tqdm import tqdm
```

## [shared_map](https://github.com/nat-chan/nokogiri/blob/main/nokogiri/shared_map.py)
share large size map/dict between notebok kernels
```bash
python -m nokogiri.shared_map /path/to/*.pkl
```
```python
from nokogiri.shared_map import shared_map
sm = shared_map("/path/to")
for x in tqdm(range(100)):
    y = sm.hoge(x) # read from /path/to/hoge.pkl
```

## [cell](https://github.com/nat-chan/nokogiri/blob/main/nokogiri/cell.py)
Bring Jupyter cell behavior to VSCode Python Interactive
```python
from nokogiri.cell import cell
A = 1
B = 2
@cell()
def func(A, B):
    C = A+B
    D = A*B
    return C, D
print(C, D) # 3, 2
```

--- 

code embeding test (recently I noticed that Readme.md is code-embeddable like this.)

https://github.com/nat-chan/nokogiri/blob/e0d438d20d28a36467337bed540a1d2770c65caa/nokogiri/tqdm_load.py#L9-L17