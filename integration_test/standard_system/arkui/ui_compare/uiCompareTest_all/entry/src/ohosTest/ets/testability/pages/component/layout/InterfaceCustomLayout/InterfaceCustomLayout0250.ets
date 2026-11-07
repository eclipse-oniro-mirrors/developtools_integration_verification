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
struct CustomLayoutPercentageComponent {
  @State measureSizeInfo: string = ''
  @State placeChildrenInfo: string = ''
  private richEditorController: RichEditorController = new RichEditorController()

  onMeasureSize(selfLayoutInfo: GeometryInfo, children: Measurable[], constraint: ConstraintSizeOptions): SizeResult {
    // 获取onMeasureSize返回的实际宽高值
    const actualWidth = (typeof constraint.maxWidth === 'number') ? constraint.maxWidth : 200
    const actualHeight = (typeof constraint.maxHeight === 'number') ? constraint.maxHeight : 150
    
    this.measureSizeInfo = `onMeasureSize - actualWidth: ${actualWidth}, actualHeight: ${actualHeight}`
    
    let sizeResult: SizeResult = { width: actualWidth, height: actualHeight }
    return sizeResult
  }

  onPlaceChildren(selfLayoutInfo: GeometryInfo, children: Layoutable[], constraint: ConstraintSizeOptions): void {
    // 查看打印的width值
    const constraintWidth = (typeof constraint.maxWidth === 'number') ? constraint.maxWidth : 0
    const constraintHeight = (typeof constraint.maxHeight === 'number') ? constraint.maxHeight : 0
    const selfWidth = selfLayoutInfo.width
    const selfHeight = selfLayoutInfo.height
    
    this.placeChildrenInfo = `onPlaceChildren - constraintWidth: ${constraintWidth}, constraintHeight: ${constraintHeight}, selfWidth: ${selfWidth}, selfHeight: ${selfHeight}`
    
    // 使用RichEditor显示宽高信息，替代console.log
    const combinedInfo = `${this.measureSizeInfo}\n${this.placeChildrenInfo}`
    this.richEditorController.addTextSpan(combinedInfo, {
      style: {
        fontColor: Color.Black,
        fontSize: 12
      }
    })
    
    // 简单的子组件布局
    for (let i = 0; i < children.length; i++) {
      children[i].layout({ x: 10, y: 10 + i * 25 })
    }
  }

  build() {
    Column() {
      Text('Custom Layout Percentage Component')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
      
      Text('百分比宽高的实际值信息：')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 5 })
      
      RichEditor({ controller: this.richEditorController })
        .id('rich_editor_customlayout_0250')
        .width('100%')
        .height(80)
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
    .backgroundColor('#F8F8FF')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
    .padding(10)
  }
}

@Entry
@Component
struct InterfaceCustomLayout0250 {

  build() {
    Column() {
      Text('Interface CustomLayout Percentage Test')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text('测试百分比宽高属性的实际值')
        .fontSize(16)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      Text('父容器宽度: 400px, 高度: 300px')
        .fontSize(14)
        .fontColor(Color.Orange)
        .margin({ bottom: 10 })

      // 父组件设置固定宽高，自定义组件使用百分比
      Column() {
        CustomLayoutPercentageComponent()
          .width('50%')  // 传入宽度为50%
          .height('60%') // 传入高度为60%
          .id('custom_layout_percentage_component_0250')
          .borderWidth(2)
          .borderColor(Color.Blue)
          .backgroundColor('#F8F8FF')
      }
      .width('55.56%')  // 父容器宽度400px
      .height(300) // 父容器高度300px
      .borderWidth(2)
      .borderColor(Color.Red)
      .backgroundColor('#FFFACD')
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
