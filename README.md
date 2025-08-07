# action-pint

[![reviewdog](https://github.com/MikeWhileCoding/action-pint/workflows/reviewdog/badge.svg)](https://github.com/MikeWhileCoding/action-pint/actions?query=workflow%3Areviewdog)
[![depup](https://github.com/MikeWhileCoding/action-pint/workflows/depup/badge.svg)](https://github.com/MikeWhileCoding/action-pint/actions?query=workflow%3Adepup)
[![release](https://github.com/MikeWhileCoding/action-pint/workflows/release/badge.svg)](https://github.com/MikeWhileCoding/action-pint/actions?query=workflow%3Arelease)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/MikeWhileCoding/action-pint?logo=github&sort=semver)](https://github.com/MikeWhileCoding/action-pint/releases)
[![action-bumpr supported](https://img.shields.io/badge/bumpr-supported-ff69b4?logo=github&link=https://github.com/haya14busa/action-bumpr)](https://github.com/haya14busa/action-bumpr)

This action runs [pint](https://github.com/laravel/pint) with [reviewdog](https://github.com/reviewdog/reviewdog) on pull requests to improve code review experience.

## Input

```yaml
inputs:
  github_token:
    description: 'GITHUB_TOKEN'
    default: '${{ github.token }}'
  workdir:
    description: 'Working directory relative to the root directory.'
    default: '.'
  ### Flags for reviewdog ###
  level:
    description: 'Report level for reviewdog [info,warning,error]'
    default: 'error'
  reporter:
    description: 'Reporter of reviewdog command [github-pr-check,github-check,github-pr-review].'
    default: 'github-pr-check'
  filter_mode:
    description: |
      Filtering mode for the reviewdog command [added,diff_context,file,nofilter].
      Default is added.
    default: 'added'
  fail_level:
    description: |
      If set to `none`, always use exit code 0 for reviewdog. Otherwise, exit code 1 for reviewdog if it finds at least 1 issue with severity greater than or equal to the given level.
      Possible values: [none,any,info,warning,error]
      Default is `none`.
    default: 'none'
  reviewdog_flags:
    description: 'Additional reviewdog flags'
    default: ''
  ### Flags for pint ###
  pint_flags:
    description: 'Additional pint flags'
    default: '--test'
```

## Usage

```yaml
name: reviewdog
on: [pull_request]
jobs:
  pint:
    name: runner / pint
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: YOUR_NAME/action-pint@v1
        with:
          github_token: ${{ secrets.github_token }}
          reporter: github-pr-review
          level: warning
```