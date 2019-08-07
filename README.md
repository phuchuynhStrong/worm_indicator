# Worm Indicator

A pageview indicator

## Features

- Use with PageView to display scroll progress

## Getting Started

Make sure you add the lib dependency in your flutter project.

```
dependencies:
  worm_indicator: 0.1.1
```

Then you should run `flutter packages get` to update your packages in your IDE.

## Example Project

Checkout the project inside `example` folder.

Screenshot:

![screenshot](https://github.com/phuchuynhStrong/worm_indicator/raw/master/example.gif "Screenshots")

## Usage

```
WormIndicator(
  length: PAGE_VIEW_SIZE,
  controller: PAGE_VIEW_CONTROLLER,
  size: DOT_SIZE_IN_PT,
  spacing: DOT_SPACING_IN_PT,
),
```

Properties:

|Name|Usage|Type|
|---|---|---|
|`length`| Number of dots |`int`|
|`controller`| PageView controller |`PageController`|
|`size`| Size of a dot |`int`|
|`spacing`| Spacing between dots |`int`|
|`color`| Color of normal dots |`Color`|
|`indicatorColor`| Color of current active dot |`Color`|

## Road map
This is the plan toward 1.0 release
- [] Add more shape configuration of the dots
- [] Add more transition animation with worm-style
- [] Add more detail documentation
- [] Write more specific example projects

## Support

Email me at `phuchuynh.strong@gmail.com` for any support needed
