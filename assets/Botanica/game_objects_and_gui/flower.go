components {
  id: "flower"
  component: "/scripts/flower.script"
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"anim\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/assets/Imagebin/flowerbook.tilesource\"\n"
  "}\n"
  ""
  scale {
    x: 5.0
    y: 5.0
  }
}
embedded_components {
  id: "selectionfactory"
  type: "factory"
  data: "prototype: \"/game_objects_and_gui/selection.go\"\n"
  ""
}
