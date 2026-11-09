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
struct CustomLayoutPlaceChildrenPaddingComponent {
  @State paddingInfo: string = ''
  private richEditorController: RichEditorController = new RichEditorController()

  onMeasureSize(selfLayoutInfo: GeometryInfo, children: Measurable[], constraint: ConstraintSizeOptions): SizeResult {
    let sizeResult: SizeResult = { width: 290, height: 170 }
    return sizeResult
  }

  onPlaceChildren(selfLayoutInfo: GeometryInfo, children: Layoutable[], constraint: ConstraintSizeOptions): void {
    // 在onPlaceChildren中打印selfLayoutInfo里的padding信息
    const padding = selfLayoutInfo.padding
    this.paddingInfo = `PlaceChildren Padding - top: ${padding?.top}, right: ${padding?.right}, bottom: ${padding?.bottom}, left: ${padding?.left}`
    
    // 使用RichEditor显示padding信息，替代console.log
    this.richEditorController.addTextSpan(this.paddingInfo, {
      style: {
        fontColor: Color.Black,
        fontSize: 14
      }
    })
    
    // 简单的子组件布局
    for (let i = 0; i < children.length; i++) {
      children[i].layout({ x: 10, y: 10 + i * 30 })
    }
  }

  build() {
    Column() {
      Text('Custom Layout PlaceChildren Padding Component')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
      
      Text('onPlaceChildren中的padding信息：')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 5 })
      
      RichEditor({ controller: this.richEditorController })
        .id('rich_editor_customlayout_0120')
        .width('100%')
        .height(60)
        .borderWidth(1)
        .borderColor(Color.Gray)
        .backgroundColor(Color.White)
      
      Text('Child Component 1')
        .fontSize(12)
        .fontColor(Color.Red)
        .backgroundColor('#FFE4E1')
        .padding(5)
      
      Text('Child Component 2')
        .fontSize(12)
        .fontColor(Color.Orange)
        .backgroundColor('#FFF8DC')
        .padding(5)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#E6E6FA')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
    .padding(10)
  }
}

@Entry
@Component
struct InterfaceCustomLayout0120 {

  build() {
    Column() {
      Text('Interface CustomLayout PlaceChildren Padding Test')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text('测试onPlaceChildren中的padding信息')
        .fontSize(16)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      // 对自定义组件设置padding值
      CustomLayoutPlaceChildrenPaddingComponent()
        .padding({ top: 18, right: 24, bottom: 30, left: 36 })
        .id('custom_layout_placechildren_padding_component_0120')
        .borderWidth(2)
        .borderColor(Color.Blue)
        .backgroundColor('#E6E6FA')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
    .padding(20)
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
  }
}
