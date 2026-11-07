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
struct CustomLayoutChildrenWidthComponent {
  @State childrenWidthInfo: string = ''
  private richEditorController: RichEditorController = new RichEditorController()

  onMeasureSize(selfLayoutInfo: GeometryInfo, children: Measurable[], constraint: ConstraintSizeOptions): SizeResult {
    // 测量子组件
    for (let i = 0; i < children.length; i++) {
      children[i].measure({ minWidth: 0, maxWidth: 300, minHeight: 0, maxHeight: 200 })
    }
    
    let sizeResult: SizeResult = { width: 320, height: 200 }
    return sizeResult
  }

  onPlaceChildren(selfLayoutInfo: GeometryInfo, children: Layoutable[], constraint: ConstraintSizeOptions): void {
    // 打印查看Children.MeasureResult.width(子组件测量后宽度)值
    let widthInfoArray: string[] = []
    
    for (let i = 0; i < children.length; i++) {
      const measureResult = children[i].measureResult
      const childWidth = measureResult.width
      const childHeight = measureResult.height
      
      widthInfoArray.push(`Child ${i + 1}: width=${childWidth}, height=${childHeight}`)
      
      // 布局子组件
      children[i].layout({ x: 10, y: 10 + i * 40 })
    }
    
    this.childrenWidthInfo = widthInfoArray.join('\n')
    
    // 使用RichEditor显示子组件测量结果信息，替代console.log
    this.richEditorController.addTextSpan(this.childrenWidthInfo, {
      style: {
        fontColor: Color.Black,
        fontSize: 12
      }
    })
  }

  build() {
    Column() {
      Text('Custom Layout Children Width Component')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
      
      Text('子组件测量后的宽度信息：')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 5 })
      
      RichEditor({ controller: this.richEditorController })
        .id('rich_editor_customlayout_0170')
        .width('100%')
        .height(80)
        .borderWidth(1)
        .borderColor(Color.Gray)
        .backgroundColor(Color.White)
      
      Text('Child Component 1 - Width Test')
        .fontSize(14)
        .fontColor(Color.Blue)
        .backgroundColor('#E0F6FF')
        .padding(8)
        .width(150)
      
      Button('Child Button 2 - Width Test')
        .fontSize(14)
        .backgroundColor(Color.Green)
        .fontColor(Color.White)
        .width(200)
      
      Text('Child Component 3 - Auto Width')
        .fontSize(12)
        .fontColor(Color.Red)
        .backgroundColor('#FFE4E1')
        .padding(6)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F0FFFF')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Start)
    .padding(15)
  }
}

@Entry
@Component
struct InterfaceCustomLayout0170 {

  build() {
    Column() {
      Text('Interface CustomLayout Children Width Test')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text('测试Children.MeasureResult.width值')
        .fontSize(16)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      // 自定义组件，测试子组件测量后的宽度
      CustomLayoutChildrenWidthComponent()
        .id('custom_layout_children_width_component_0170')
        .width('90%')
        .height(300)
        .borderWidth(2)
        .borderColor(Color.Gray)
        .backgroundColor('#F0FFFF')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
    .padding(20)
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
  }
}
