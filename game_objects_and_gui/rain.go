components {
  id: "rain"
  component: "/scripts/rain.script"
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"anim\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/assets/Imagebin/rain.tilesource\"\n"
  "}\n"
  ""
  position {
    x: -7.0
    y: 48.0
  }
  scale {
    x: 2.0
    y: 2.0
  }
}
