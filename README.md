# Worm Indicator

A pageview indicator

## Features

- Use with PageView to display scroll progress

## Getting Started

Make sure you add the lib dependency in your flutter project.

```
dependencies:
  worm_indicator: 0.0.3
```

Then you should run `flutter packages get` to update your packages in your IDE.

## Example Project

Checkout the project inside `example` folder.

## Usage

```
WormIndicator(
  length: 3,
  controller: _controller,
  size: 16,
  spacing: 8,
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

## Support

Email me at `phuchuynh.strong@gmail.com` for any support needed
