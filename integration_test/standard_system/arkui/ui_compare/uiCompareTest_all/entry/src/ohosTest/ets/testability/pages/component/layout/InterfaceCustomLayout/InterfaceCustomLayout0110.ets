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
struct CustomLayoutPlaceChildrenMarginComponent {
  @State marginInfo: string = ''
  private richEditorController: RichEditorController = new RichEditorController()

  onMeasureSize(selfLayoutInfo: GeometryInfo, children: Measurable[], constraint: ConstraintSizeOptions): SizeResult {
    let sizeResult: SizeResult = { width: 280, height: 160 }
    return sizeResult
  }

  onPlaceChildren(selfLayoutInfo: GeometryInfo, children: Layoutable[], constraint: ConstraintSizeOptions): void {
    // 在onPlaceChildren中打印selfLayoutInfo里的margin信息
    const margin = selfLayoutInfo.margin
    this.marginInfo = `PlaceChildren Margin - top: ${margin?.top}, right: ${margin?.right}, bottom: ${margin?.bottom}, left: ${margin?.left}`
    
    // 使用RichEditor显示margin信息，替代console.log
    this.richEditorController.addTextSpan(this.marginInfo, {
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
      Text('Custom Layout PlaceChildren Margin Component')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
      
      Text('onPlaceChildren中的margin信息：')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 5 })
      
      RichEditor({ controller: this.richEditorController })
        .id('rich_editor_customlayout_0110')
        .width('100%')
        .height(60)
        .borderWidth(1)
        .borderColor(Color.Gray)
        .backgroundColor(Color.White)
      
      Text('Child Component 1')
        .fontSize(12)
        .fontColor(Color.Blue)
        .backgroundColor('#E0E0E0')
        .padding(5)
      
      Text('Child Component 2')
        .fontSize(12)
        .fontColor(Color.Green)
        .backgroundColor('#F0F0F0')
        .padding(5)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5DC')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
    .padding(10)
  }
}

@Entry
@Component
struct InterfaceCustomLayout0110 {

  build() {
    Column() {
      Text('Interface CustomLayout PlaceChildren Margin Test')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text('测试onPlaceChildren中的margin信息')
        .fontSize(16)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      // 对自定义组件设置margin值
      CustomLayoutPlaceChildrenMarginComponent()
        .margin({ top: 15, right: 20, bottom: 25, left: 30 })
        .id('custom_layout_placechildren_margin_component_0110')
        .borderWidth(2)
        .borderColor(Color.Pink)
        .backgroundColor('#F5F5DC')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
    .padding(20)
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
  }
}
