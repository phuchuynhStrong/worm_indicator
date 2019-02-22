# Worm Indicator

A pageview indicator

## Features

- Use with PageView to display scroll progress

## Getting Started

Make sure you add the lib dependency in your flutter project.

```
dependencies:
  worm_indicator: 0.0.4
```

Then you should run `flutter packages get` to update your packages in your IDE.

## Example Project

Checkout the project inside `example` folder.

## Usage

```
WormIndicator(
  length: 3,
  controller: _controller,
  shape: Shape(
    16, // Width
    16, // Height
    8, // Spacing
    DotShape.Circle
  ),
),
```

Properties:

|Name|Usage|Type|
|---|---|---|
|`length`| Number of dots |`int`|
|`controller`| PageView controller |`PageController`|
|`shape`| Shape of dots |`Shape`|
|`color`| Color of normal dots |`Color`|
|`indicatorColor`| Color of current active dot |`Color`|

Shape Constructor:

|Name|Usage|Type|
|---|---|---|
|`width`| Width of dot |`double`|
|`height`| Height of dot |`double`|
|`spacing`| Spacing between dots |`double`|
|`shape`| Shape of dots. One of Circle, Rectangle and Square |`DotShape`|

## Support

Email me at `phuchuynh.strong@gmail.com` for any support needed
