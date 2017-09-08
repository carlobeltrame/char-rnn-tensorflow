char-rnn-tensorflow
===

Multi-layer Recurrent Neural Networks (LSTM, RNN) for character-level language models in Python using Tensorflow.

Based on this [tensorflow implementation](https://github.com/sherjilozair/char-rnn-tensorflow) of Andrej Karpathy's [char-rnn](https://github.com/karpathy/char-rnn).

## Basic Usage
You can use Docker to run the code without having to install anything else first:
```bash
docker build .
docker run -p 6006:6006 -it (id from docker build)
python train.py
python sample.py
```

## Datasets
You can use any plain text file as input. For example you could download [The complete Sherlock Holmes](https://sherlock-holm.es/ascii/) as such:

```bash
cd data
mkdir sherlock
cd sherlock
wget https://sherlock-holm.es/stories/plain-text/cnus.txt
mv cnus.txt input.txt
```

Then start train from the top level directory using `python train.py --data_dir=./data/sherlock/`

A quick tip to concatenate many small disparate `.txt` files into one large training file: `ls *.txt | xargs -L 1 cat >> input.txt`

## Tensorboard
To visualize training progress, model graphs, and internal state histograms, execute the following command from a different terminal:
```bash
$ tensorboard --logdir=./logs/
```

Then open a browser to [http://localhost:6006](http://localhost:6006).

