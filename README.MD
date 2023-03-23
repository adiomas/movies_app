# Movies App

## Changelog generator

These steps are necessary after cloning git repository to have 
changelog generator executed automatically each time you commit something
to your repository. For more info check changelog_generator/README.md file.

Run the following commands to install Jinja2 package necessary for generating changelog file
and setup pre-commit hook so changelog generator can be executed on each commit.
```
pip3 install Jinja2
mkdir -p .git/hooks/ && cp changelog_generator/pre-commit .git/hooks/
```
