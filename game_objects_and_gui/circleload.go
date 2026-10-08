components {
  id: "circle"
  component: "/scripts/circle.script"
}
embedded_components {
  id: "sprite1"
  type: "sprite"
  data: "default_animation: \"top\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "size {\n"
  "  x: 20.0\n"
  "  y: 4.0\n"
  "}\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/assets/Imagebin/circle loading bar.tilesource\"\n"
  "}\n"
  ""
  position {
    y: 6.0
    z: -0.001
  }
  scale {
    x: 3.0
    y: 3.0
  }
}
embedded_components {
  id: "sprite2"
  type: "sprite"
  data: "default_animation: \"bottom\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "size {\n"
  "  x: 20.0\n"
  "  y: 4.0\n"
  "}\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/assets/Imagebin/circle loading bar.tilesource\"\n"
  "}\n"
  ""
  position {
    y: -6.0
    z: 0.001
  }
  scale {
    x: 3.0
    y: 3.0
  }
}
