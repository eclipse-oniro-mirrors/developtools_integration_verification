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
struct CustomLayoutUnitConsistencyComponent {
  @State unitConsistencyInfo: string = ''
  private richEditorController: RichEditorController = new RichEditorController()

  onMeasureSize(selfLayoutInfo: GeometryInfo, children: Measurable[], constraint: ConstraintSizeOptions): SizeResult {
    // 测量子组件
    for (let i = 0; i < children.length; i++) {
      children[i].measure({ minWidth: 0, maxWidth: 280, minHeight: 0, maxHeight: 200 })
    }
    
    let sizeResult: SizeResult = { width: 320, height: 200 }
    return sizeResult
  }

  onPlaceChildren(selfLayoutInfo: GeometryInfo, children: Layoutable[], constraint: ConstraintSizeOptions): void {
    // 查看各参数打印值，验证单位一致性
    
    // selfLayoutInfo信息
    const selfWidth = selfLayoutInfo.width
    const selfHeight = selfLayoutInfo.height
    const selfMargin = selfLayoutInfo.margin
    const selfPadding = selfLayoutInfo.padding
    
    // constraint信息
    const constraintMinWidth = constraint.minWidth
    const constraintMaxWidth = constraint.maxWidth
    const constraintMinHeight = constraint.minHeight
    const constraintMaxHeight = constraint.maxHeight
    
    // MeasureResult信息（子组件测量结果）
    let measureResultInfo = ''
    for (let i = 0; i < children.length; i++) {
      const measureResult = children[i].measureResult
      measureResultInfo += `Child${i + 1}: width=${measureResult.width}, height=${measureResult.height}; `
      
      // 布局子组件
      children[i].layout({ x: 10, y: 10 + i * 30 })
    }
    
    // 组合所有信息进行对比
    this.unitConsistencyInfo = `selfLayoutInfo: width=${selfWidth}, height=${selfHeight}, margin(t:${selfMargin?.top},r:${selfMargin?.right},b:${selfMargin?.bottom},l:${selfMargin?.left}), padding(t:${selfPadding?.top},r:${selfPadding?.right},b:${selfPadding?.bottom},l:${selfPadding?.left})\nconstraint: minW=${constraintMinWidth}, maxW=${constraintMaxWidth}, minH=${constraintMinHeight}, maxH=${constraintMaxHeight}\nMeasureResult: ${measureResultInfo}`
    
    // 使用RichEditor显示单位一致性信息，替代console.log
    this.richEditorController.addTextSpan(this.unitConsistencyInfo, {
      style: {
        fontColor: Color.Black,
        fontSize: 11
      }
    })
  }

  build() {
    Column() {
      Text('Custom Layout Unit Consistency Component')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
      
      Text('各参数单位一致性信息：')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 5 })
      
      RichEditor({ controller: this.richEditorController })
        .id('rich_editor_customlayout_0260')
        .width('100%')
        .height(100)
        .borderWidth(1)
        .borderColor(Color.Gray)
        .backgroundColor(Color.White)
      
      Text('Child Component 1')
        .fontSize(12)
        .fontColor(Color.Blue)
        .backgroundColor('#E0F6FF')
        .padding(8)
        .width(120)
        .height(30)
      
      Text('Child Component 2')
        .fontSize(12)
        .fontColor(Color.Green)
        .backgroundColor('#F0FFF0')
        .padding(8)
        .width(150)
        .height(35)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
    .padding(10)
  }
}

@Entry
@Component
struct InterfaceCustomLayout0260 {

  build() {
    Column() {
      Text('Interface CustomLayout Unit Consistency Test')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text('测试selfLayoutInfo与MeasureResult、constraint单位一致性')
        .fontSize(16)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      // 父组件设置约束和样式，用于测试单位一致性
      Column() {
        CustomLayoutUnitConsistencyComponent()
          .width(300)
          .height(250)
          .margin({ top: 10, right: 15, bottom: 20, left: 25 })
          .padding({ top: 8, right: 12, bottom: 16, left: 20 })
          .id('custom_layout_unit_consistency_component_0260')
          .borderWidth(2)
          .borderColor(Color.Orange)
          .backgroundColor('#FAFAFA')
      }
      .width('52.78%')
      .height('26.23%')
      .constraintSize({
        minWidth: 200,
        maxWidth: 480,
        minHeight: 180,
        maxHeight: 400
      })
      .borderWidth(2)
      .borderColor(Color.Orange)
      .backgroundColor('#FFF8DC')
      .padding(15)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
    .padding(20)
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
  }
}
