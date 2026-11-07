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
struct SpecialComponentsEmbeddedComponentWidthAndHeight0020 {

  private want: Want = {
    bundleName: 'com.example.uicompare',
    abilityName: 'TestAbility',
  };

  @State firstWidth: number = 100
  @State firstHeight: number = 100
  @State secondWidth: number = 100
  @State secondHeight: number = 100

  build() {
    Column() {
      Text('第一个EmbeddedComponent')
        .fontSize(16)
        .margin({ top: 10, bottom: 10 })

      EmbeddedComponent(this.want, EmbeddedType.EMBEDDED_UI_EXTENSION)
        .width(this.firstWidth)
        .height(this.firstHeight)
        .id('SpecialComponentsEmbeddedComponentWidthAndHeight0020_001')

      Text('第二个EmbeddedComponent')
        .fontSize(16)
        .margin({ top: 20, bottom: 10 })

      EmbeddedComponent(this.want, EmbeddedType.EMBEDDED_UI_EXTENSION)
        .width(this.secondWidth)
        .height(this.secondHeight)
        .id('SpecialComponentsEmbeddedComponentWidthAndHeight0020_002')

      Row() {
        Button('宽增加(10px)')
          .margin({ top: 30, right: 10 })
          .height(40)
          .id('SpecialComponentsEmbeddedComponentWidthAndHeight0020_003')
          .onClick(() => {
            this.secondWidth += 10
            console.info(`宽度增加后: ${this.secondWidth}px`)
          })

        Button('宽减少(10px)')
          .margin({ top: 30 })
          .height(40)
          .id('SpecialComponentsEmbeddedComponentWidthAndHeight0020_004')
          .onClick(() => {
            this.secondWidth -= 10
            console.info(`宽度减少后: ${this.secondWidth}px`)
          })
      }
      .justifyContent(FlexAlign.Center)

      Text(`当前第二个组件宽度: ${this.secondWidth}px`)
        .fontSize(14)
        .margin({ top: 20 })
        .id('SpecialComponentsEmbeddedComponentWidthAndHeight0020_005')

      Button('打印组件信息')
        .margin({ top: 30 })
        .height(40)
        .id('SpecialComponentsEmbeddedComponentWidthAndHeight0020_006')
        .onClick(() => {
          console.info(getInspectorByKey('SpecialComponentsEmbeddedComponentWidthAndHeight0020_002'))
        })

    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}