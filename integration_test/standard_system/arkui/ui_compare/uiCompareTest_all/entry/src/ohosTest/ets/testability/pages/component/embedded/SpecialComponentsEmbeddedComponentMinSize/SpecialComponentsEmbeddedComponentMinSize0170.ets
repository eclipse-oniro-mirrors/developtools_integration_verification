/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */



@Entry
@Component
struct SpecialComponentsEmbeddedComponentMinSize0170 {

  private want: Want = {
    bundleName: 'com.example.uicompare',
    abilityName: 'TestAbility',
  };

  @State WIDTH:number = 15
  @State HEIGHT:number = 15


  build() {
    Column() {

      EmbeddedComponent(this.want, EmbeddedType.EMBEDDED_UI_EXTENSION)
        .width(this.WIDTH)
        .height(this.HEIGHT)
        .id('SpecialComponentsEmbeddedComponentMinSize0170_001')

      Button('Button1')
        .margin({top:30})
        .height(40)
        .id('SpecialComponentsEmbeddedComponentMinSize0170_002')
        .onClick(()=>{
          this.WIDTH=5
          this.HEIGHT=5
        })

      Button('Button2')
        .margin({top:30})
        .height(40)
        .id('SpecialComponentsEmbeddedComponentMinSize0170_003')
        .onClick(()=>{
          console.info(getInspectorByKey('SpecialComponentsEmbeddedComponentMinSize0170_001'))
        })

    }
  }
}

