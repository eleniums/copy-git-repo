# copy-git-repo

A script to copy a git repository from one location to another, including all branches and tags. Particularly useful when moving a repository from one provider to another.

## Usage

First, create a new repository to be the destination of the copied repository. Then execute the script:

```sh
copyrepo.sh source-repository-url destination-repository-url
```

That's it! Everything should be copied over to the new location.

## Manual Git Commands

This script follows the instructions provided by GitHub [here](https://help.github.com/articles/duplicating-a-repository/).

1. Create a new repository to copy the source repository to.
2. Create a temporary clone of the repository you would like to copy:
    ```sh
    git clone --bare https://github.com/exampleuser/source-repository.git
    ```

3. Push the copy to the new repository:
    ```sh
    cd source-repository.git
    git push --mirror https://github.com/exampleuser/destination-repository.git
    ```

4. Remove the temporary repository:
    ```sh
    cd ..
    rm -rf source-repository.git
    ```

NOTE: Additional steps are required if your repository contains Large File Storage objects.
