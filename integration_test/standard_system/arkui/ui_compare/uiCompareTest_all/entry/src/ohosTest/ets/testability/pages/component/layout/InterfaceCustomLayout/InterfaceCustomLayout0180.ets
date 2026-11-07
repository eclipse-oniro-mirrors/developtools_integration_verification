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
struct CustomLayoutChildrenHeightComponent {
  @State childrenHeightInfo: string = ''
  private richEditorController: RichEditorController = new RichEditorController()

  onMeasureSize(selfLayoutInfo: GeometryInfo, children: Measurable[], constraint: ConstraintSizeOptions): SizeResult {
    // 测量子组件
    for (let i = 0; i < children.length; i++) {
      children[i].measure({ minWidth: 0, maxWidth: 300, minHeight: 0, maxHeight: 250 })
    }
    
    let sizeResult: SizeResult = { width: 330, height: 220 }
    return sizeResult
  }

  onPlaceChildren(selfLayoutInfo: GeometryInfo, children: Layoutable[], constraint: ConstraintSizeOptions): void {
    // 打印查看Children.MeasureResult.height(子组件测量后高度)值
    let heightInfoArray: string[] = []
    
    for (let i = 0; i < children.length; i++) {
      const measureResult = children[i].measureResult
      const childWidth = measureResult.width
      const childHeight = measureResult.height
      
      heightInfoArray.push(`Child ${i + 1}: width=${childWidth}, height=${childHeight}`)
      
      // 布局子组件
      children[i].layout({ x: 10, y: 10 + i * 45 })
    }
    
    this.childrenHeightInfo = heightInfoArray.join('\n')
    
    // 使用RichEditor显示子组件测量结果信息，替代console.log
    this.richEditorController.addTextSpan(this.childrenHeightInfo, {
      style: {
        fontColor: Color.Black,
        fontSize: 12
      }
    })
  }

  build() {
    Column() {
      Text('Custom Layout Children Height Component')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
      
      Text('子组件测量后的高度信息：')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 5 })
      
      RichEditor({ controller: this.richEditorController })
        .id('rich_editor_customlayout_0180')
        .width('100%')
        .height(90)
        .borderWidth(1)
        .borderColor(Color.Gray)
        .backgroundColor(Color.White)
      
      Text('Child Component 1 - Height Test')
        .fontSize(14)
        .fontColor(Color.Blue)
        .backgroundColor('#E0F6FF')
        .padding(10)
        .height(40)
      
      Button('Child Button 2 - Height Test')
        .fontSize(14)
        .backgroundColor(Color.Green)
        .fontColor(Color.White)
        .height(50)
      
      Text('Child Component 3 - Auto Height')
        .fontSize(12)
        .fontColor(Color.Red)
        .backgroundColor('#FFE4E1')
        .padding(12)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFFAF0')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Start)
    .padding(15)
  }
}

@Entry
@Component
struct InterfaceCustomLayout0180 {

  build() {
    Column() {
      Text('Interface CustomLayout Children Height Test')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text('测试Children.MeasureResult.height值')
        .fontSize(16)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      // 自定义组件，测试子组件测量后的高度
      CustomLayoutChildrenHeightComponent()
        .id('custom_layout_children_height_component_0180')
        .width('90%')
        .height(320)
        .borderWidth(2)
        .borderColor(Color.Orange)
        .backgroundColor('#FFFAF0')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
    .padding(20)
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
  }
}
