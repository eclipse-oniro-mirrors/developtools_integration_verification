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
struct CustomLayoutMaxWidthComponent {
  @State constraintInfo: string = ''
  private richEditorController: RichEditorController = new RichEditorController()

  onMeasureSize(selfLayoutInfo: GeometryInfo, children: Measurable[], constraint: ConstraintSizeOptions): SizeResult {
    // 打印查看constraint.maxWidth值
    const minWidth = constraint.minWidth
    const maxWidth = constraint.maxWidth
    const minHeight = constraint.minHeight
    const maxHeight = constraint.maxHeight
    
    this.constraintInfo = `Constraint - minWidth: ${minWidth}, maxWidth: ${maxWidth}, minHeight: ${minHeight}, maxHeight: ${maxHeight}`
    
    // 使用RichEditor显示constraint信息，替代console.log
    this.richEditorController.addTextSpan(this.constraintInfo, {
      style: {
        fontColor: Color.Black,
        fontSize: 14
      }
    })
    
    let sizeResult: SizeResult = { width: 280, height: 130 }
    return sizeResult
  }

  onPlaceChildren(selfLayoutInfo: GeometryInfo, children: Layoutable[], constraint: ConstraintSizeOptions): void {
    // 简单布局实现
  }

  build() {
    Column() {
      Text('Custom Layout MaxWidth Component')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
      
      Text('查看父组件约束信息（重点关注maxWidth）：')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 5 })
      
      RichEditor({ controller: this.richEditorController })
        .id('rich_editor_customlayout_0080')
        .width('100%')
        .height(80)
        .borderWidth(1)
        .borderColor(Color.Gray)
        .backgroundColor(Color.White)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFF8DC')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
    .padding(10)
  }
}

@Entry
@Component
struct InterfaceCustomLayout0080 {

  build() {
    Column() {
      Text('Interface CustomLayout MaxWidth Test')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text('测试constraint.maxWidth约束值')
        .fontSize(16)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      // 父组件设置约束，自定义组件将获取这些约束信息
      Column() {
        CustomLayoutMaxWidthComponent()
          .id('custom_layout_maxwidth_component_0080')
      }
      .width('48.61%')
      .height('18.03%')
      .constraintSize({
        minWidth: 180,
        maxWidth: 450,
        minHeight: 120,
        maxHeight: 350
      })
      .borderWidth(2)
      .borderColor(Color.Orange)
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
