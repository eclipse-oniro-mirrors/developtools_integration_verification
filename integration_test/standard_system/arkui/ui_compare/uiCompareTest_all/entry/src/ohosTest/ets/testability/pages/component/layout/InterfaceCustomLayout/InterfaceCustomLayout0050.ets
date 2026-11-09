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
struct CustomLayoutDefaultComponent {
  @State layoutInfo: string = 'Default layout without measure operations'
  private richEditorController: RichEditorController = new RichEditorController()

  aboutToAppear() {
    // 使用RichEditor显示布局信息
    this.richEditorController.addTextSpan(this.layoutInfo, {
      style: {
        fontColor: Color.Black,
        fontSize: 16
      }
    })
  }

  onMeasureSize(selfLayoutInfo: GeometryInfo, children: Measurable[], constraint: ConstraintSizeOptions): SizeResult {
    // 不进行任何measure操作，让子组件按默认布局能力布局
    let sizeResult: SizeResult = { width: 300, height: 200 }
    return sizeResult
  }

  onPlaceChildren(selfLayoutInfo: GeometryInfo, children: Layoutable[], constraint: ConstraintSizeOptions): void {
    // 不进行任何place操作，让子组件按默认布局能力布局
  }

  build() {
    Column() {
      Text('Custom Layout Default Component')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
      
      // 子组件1
      Text('Child Component 1')
        .fontSize(14)
        .fontColor(Color.Blue)
        .backgroundColor('#E0E0E0')
        .padding(8)
        .margin({ bottom: 5 })
      
      // 子组件2
      Button('Child Button 2')
        .fontSize(14)
        .backgroundColor(Color.Green)
        .fontColor(Color.White)
        .margin({ bottom: 5 })
      
      // 子组件3 - RichEditor显示信息
      RichEditor({ controller: this.richEditorController })
        .id('rich_editor_customlayout_0050')
        .width('90%')
        .height(40)
        .borderWidth(1)
        .borderColor(Color.Gray)
        .backgroundColor(Color.White)
        .margin({ bottom: 5 })
      
      // 子组件4
      Text('Child Component 4')
        .fontSize(14)
        .fontColor(Color.Red)
        .backgroundColor('#F0F0F0')
        .padding(8)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
    .padding(10)
  }
}

@Entry
@Component
struct InterfaceCustomLayout0050 {

  build() {
    Column() {
      Text('Interface CustomLayout Default Test')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text('测试自定义组件子组件默认布局能力')
        .fontSize(16)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      // 自定义组件，不进行任何measure操作
      CustomLayoutDefaultComponent()
        .id('custom_layout_default_component_0050')
        .width('90%')
        .height(300)
        .borderWidth(2)
        .borderColor(Color.Orange)
        .backgroundColor(Color.White)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
    .padding(20)
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
  }
}
