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

@Component
struct CustomLayoutPlaceChildrenDefaultComponent {
  @State layoutInfo: string = 'Default layout without layout operations'
  private richEditorController: RichEditorController = new RichEditorController()

  aboutToAppear() {
    // 使用RichEditor显示布局信息
    this.richEditorController.addTextSpan(this.layoutInfo, {
      style: {
        fontColor: Color.Black,
        fontSize: 14
      }
    })
  }

  onMeasureSize(selfLayoutInfo: GeometryInfo, children: Measurable[], constraint: ConstraintSizeOptions): SizeResult {
    let sizeResult: SizeResult = { width: 320, height: 220 }
    return sizeResult
  }

  onPlaceChildren(selfLayoutInfo: GeometryInfo, children: Layoutable[], constraint: ConstraintSizeOptions): void {
    // 不进行任何layout操作，让子组件按默认布局能力布局
  }

  build() {
    Column() {
      Text('Custom Layout PlaceChildren Default Component')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
      
      Text('不进行layout操作的子组件默认布局：')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 5 })
      
      // 子组件1 - RichEditor显示信息
      RichEditor({ controller: this.richEditorController })
        .id('rich_editor_customlayout_0150')
        .width('90%')
        .height(40)
        .borderWidth(1)
        .borderColor(Color.Gray)
        .backgroundColor(Color.White)
        .margin({ bottom: 8 })
      
      // 子组件2
      Text('Child Component 1 - Default Layout')
        .fontSize(14)
        .fontColor(Color.Blue)
        .backgroundColor('#E0F6FF')
        .padding(8)
        .margin({ bottom: 8 })
        .borderRadius(5)
      
      // 子组件3
      Button('Child Button 2 - Default Layout')
        .fontSize(14)
        .backgroundColor(Color.Green)
        .fontColor(Color.White)
        .margin({ bottom: 8 })
        .borderRadius(5)
      
      // 子组件4
      Row() {
        Text('Child Row 3')
          .fontSize(12)
          .fontColor(Color.Red)
          .backgroundColor('#FFE4E1')
          .padding(5)
          .margin({ right: 10 })
        
        Text('Default Layout')
          .fontSize(12)
          .fontColor(Color.Orange)
          .backgroundColor('#FFF8DC')
          .padding(5)
      }
      .justifyContent(FlexAlign.Center)
      .margin({ bottom: 8 })
      
      // 子组件5
      Text('Child Component 4 - Bottom')
        .fontSize(14)
        .fontColor(Color.Brown)
        .backgroundColor('#E6E6FA')
        .padding(8)
        .borderRadius(5)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F8F8FF')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
    .padding(15)
  }
}

@Entry
@Component
struct InterfaceCustomLayout0150 {

  build() {
    Column() {
      Text('Interface CustomLayout PlaceChildren Default Test')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text('测试onPlaceChildren中子组件默认布局能力')
        .fontSize(16)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      // 自定义组件，不进行任何layout操作
      CustomLayoutPlaceChildrenDefaultComponent()
        .id('custom_layout_placechildren_default_component_0150')
        .width('90%')
        .height(350)
        .borderWidth(2)
        .borderColor(Color.Blue)
        .backgroundColor('#F8F8FF')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
    .padding(20)
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
  }
}
