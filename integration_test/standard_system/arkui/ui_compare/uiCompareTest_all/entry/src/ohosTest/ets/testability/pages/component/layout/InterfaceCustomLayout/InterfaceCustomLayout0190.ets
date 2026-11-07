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
struct CustomLayoutPlaceChildrenMinWidthComponent {
  @State constraintInfo: string = ''
  private richEditorController: RichEditorController = new RichEditorController()

  onMeasureSize(selfLayoutInfo: GeometryInfo, children: Measurable[], constraint: ConstraintSizeOptions): SizeResult {
    let sizeResult: SizeResult = { width: 280, height: 160 }
    return sizeResult
  }

  onPlaceChildren(selfLayoutInfo: GeometryInfo, children: Layoutable[], constraint: ConstraintSizeOptions): void {
    // 打印查看constraint.minWidth值
    const minWidth = constraint.minWidth
    const maxWidth = constraint.maxWidth
    const minHeight = constraint.minHeight
    const maxHeight = constraint.maxHeight
    
    this.constraintInfo = `PlaceChildren Constraint - minWidth: ${minWidth}, maxWidth: ${maxWidth}, minHeight: ${minHeight}, maxHeight: ${maxHeight}`
    
    // 使用RichEditor显示constraint信息，替代console.log
    this.richEditorController.addTextSpan(this.constraintInfo, {
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
      Text('Custom Layout PlaceChildren MinWidth Component')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
      
      Text('onPlaceChildren中的constraint.minWidth信息：')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 5 })
      
      RichEditor({ controller: this.richEditorController })
        .id('rich_editor_customlayout_0190')
        .width('100%')
        .height(60)
        .borderWidth(1)
        .borderColor(Color.Gray)
        .backgroundColor(Color.White)
      
      Text('Child Component 1')
        .fontSize(12)
        .fontColor(Color.Blue)
        .backgroundColor('#E0F6FF')
        .padding(5)
      
      Text('Child Component 2')
        .fontSize(12)
        .fontColor(Color.Green)
        .backgroundColor('#F0FFF0')
        .padding(5)
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
struct InterfaceCustomLayout0190 {

  build() {
    Column() {
      Text('Interface CustomLayout PlaceChildren MinWidth Test')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text('测试onPlaceChildren中的constraint.minWidth约束值')
        .fontSize(16)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      // 父组件设置约束，自定义组件将在onPlaceChildren中获取这些约束信息
      Column() {
        CustomLayoutPlaceChildrenMinWidthComponent()
          .id('custom_layout_placechildren_minwidth_component_0190')
      }
      .width('44.44%')
      .height('19.67%')
      .constraintSize({
        minWidth: 220,
        maxWidth: 420,
        minHeight: 160,
        maxHeight: 320
      })
      .borderWidth(2)
      .borderColor(Color.Blue)
      .backgroundColor('#F0F8FF')
      .padding(10)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
    .padding(20)
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
  }
}
