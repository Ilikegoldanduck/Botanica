components {
  id: "selection"
  component: "/scripts/selection.script"
}
embedded_components {
  id: "Harvest"
  type: "sprite"
  data: "default_animation: \"anim\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/assets/Imagebin/harvestButton.tilesource\"\n"
  "}\n"
  ""
  position {
    x: 81.25
    y: 22.5
  }
  scale {
    x: 2.5
    y: 2.5
  }
}
embedded_components {
  id: "Pollinate"
  type: "sprite"
  data: "default_animation: \"anim\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/assets/Imagebin/pollinateButton.tilesource\"\n"
  "}\n"
  ""
  position {
    x: 90.0
    y: 58.0
  }
  scale {
    x: 2.5
    y: 2.5
    z: 0.5
  }
}
