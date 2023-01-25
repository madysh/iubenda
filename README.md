# README

The T&C generator is a software which, given:
- Atemplate
- Adataset
transforms the template into a Document expanding the template tags into their representation using the dataset.


# Requirements

The main code works well with ruby 2.6 and ruby 3.2.0.


# Data for testing

Follow code uses files from ./data folder which you can edit. Without them the code displays an error.

## required data files

### clauses.json

clauses.json file contains data for Clause objects

example:

```
[
  { "id": 1, "text": "The quick brown fox" },
  { "id": 2, "text": "jumps over the lazy dog" },
  { "id": 3, "text": "And dies" },
  { "id": 4, "text": "The white horse is white" }
]
```

### sections.json

sections.json file contains data for Section objects

example:

```
[
  { "id": 1, "clauses_ids": [1, 2] }
]
```

### template.txt

template.txt contains template content

example:

```
This document is made of plaintext.
Is made of [CLAUSE-3].
Is made of [CLAUSE-4].
Is made of [SECTION-1]
```

# Commands

## To run the code

just run iubenda.rb ruby file
    ```
    ruby iubenda.rb
    ```

## To run specs

1. install bundler if it's missed
    ```
    gem install bundler
    ```
2. install required gems if you did not do it before
    ```
    bundle install
    ```
3. run specs
    ```
    rspec
    ```
or run with additional options to see tested cases
    ```
    rspec -cfd
    ```


# Implementation notes

The implementation of this code took about 5hrs.

I don't like how I use patterns for marks ([CLAUSE-1]) and I would try to improve it first of all by having more time.

And I'm not sure that I catch all cases where there may be exceptions.
