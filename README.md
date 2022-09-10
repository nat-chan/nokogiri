# nokogiri


This Python library is a sharp "nokogiri" that cuts through the problems that arise in the process of trial and error, such as machine learning.

```bash
pip install nokogiri
```

## [spylus](https://github.com/nat-chan/nokogiri/blob/main/notebook/test_spylus.ipynb)
```python
from nokogiri.spylus import spylus
```
- Now you can draw image with stylus pen or drawing tablet such as iPad, Surface and Wacom in JupyterLab/Notebook.
- Of course it senses pressure so you can control the thickness of the line.
- Clipboard image copy/paste feature supported! this is super effective for AI painting with clip studio/photoshop.
- VSCode greatly limits functionality due to policies that prohibit the execution of javascript in notebooks. Please use JupyterLab/Notebook.

### Try it

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/nat-chan/nokogiri/main?filepath=notebook/test_spylus.ipynb)
Hit this button and launch demo via binder.
- [launch demo via binder](https://mybinder.org/v2/gh/nat-chan/nokogiri/main?filepath=notebook/test_spylus.ipynb)
- [Just read usage on github](https://github.com/nat-chan/nokogiri/blob/main/notebook/test_spylus.ipynb)

### screenshot
![demo.gif](https://i.imgur.com/Jzxg3ah.gif)

--- 


## [working_dir](https://github.com/nat-chan/nokogiri/blob/main/tests/working_dir.py)
Enables import of any module not in the project tree from anywhere at any time
```python
from nokogiri.working_dir import working_dir
with working_dir("/path/to/isolated_module"):
    import isolated_module
    with open("isolated_data") as f:
        isolated_data = f.read()
```

## [tqdm_load](https://github.com/nat-chan/nokogiri/blob/main/tests/test_tqdm_load.py)
Display a progress bar while reading a pickle file
```python
from nokogiri.tqdm_load import tqdm_load
data = tqdm_load("/path/to/data.pkl")
```

## [defaultdotdict](https://github.com/nat-chan/nokogiri/blob/main/tests/test_defaultdotdict.py)
defaultdict but also dotdict
```python
from nokogiri.defaultdotdict import defaultdotdict
sounds = defaultdotdict(lambda: "meow")
print(sounds.dog) # "meow"
sounds["dog"] = "bow" # you can also access with []
print(sounds.dog) # "bow"
```

## [which_env](https://github.com/nat-chan/nokogiri/blob/main/tests/test_which_env.py)
Detect notebook environment is jupyter or vscode or terminal...
```python
from nokogiri.which_env import which_env
```

## [shared_map](https://github.com/nat-chan/nokogiri/blob/main/tests/test_shared_map.py)
share large size map/dict between notebok kernels
```python
from nokogiri.shared_map import shared_map
```

## [curry](https://github.com/nat-chan/nokogiri/blob/main/tests/test_curry.py)
currying function. add some syntax sugar for a lot of function arguments.
```python
from nokogiri.curry import curry
@curry
def func(a="a", b="b", c="c", d="d", e="e"):
    return f"/{a}/{b}/{c}/{d}/{e}"
F.hoge.fuga.piyo("A") #"/A/hoge/fuga/piyo/e"
```

## [cell](https://github.com/nat-chan/nokogiri/blob/main/tests/test_cell.py)
Bring Jupyter cell behavior to VSCode Python Interactive
```python
from nokogiri.cell import cell
```

--- 

code embeding test (recently I noticed that Readme.md is code-embeddable like this.)

https://github.com/nat-chan/nokogiri/blob/e0d438d20d28a36467337bed540a1d2770c65caa/tests/test_tqdm_load.py#L9-L17