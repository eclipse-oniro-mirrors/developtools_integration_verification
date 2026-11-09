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
struct CustomLayoutPaddingComponent {
  @State paddingInfo: string = ''
  private richEditorController: RichEditorController = new RichEditorController()

  onMeasureSize(selfLayoutInfo: GeometryInfo, children: Measurable[], constraint: ConstraintSizeOptions): SizeResult {
    // 打印selfLayoutInfo里的padding信息
    const padding = selfLayoutInfo.padding
    this.paddingInfo = `Padding - top: ${padding?.top}, right: ${padding?.right}, bottom: ${padding?.bottom}, left: ${padding?.left}`
    
    // 使用RichEditor显示padding信息，替代console.log
    this.richEditorController.addTextSpan(this.paddingInfo, {
      style: {
        fontColor: Color.Black,
        fontSize: 16
      }
    })
    
    let sizeResult: SizeResult = { width: 200, height: 100 }
    return sizeResult
  }

  onPlaceChildren(selfLayoutInfo: GeometryInfo, children: Layoutable[], constraint: ConstraintSizeOptions): void {
    // 简单布局实现
  }

  build() {
    Column() {
      Text('Custom Layout Padding Component')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
      
      RichEditor({ controller: this.richEditorController })
        .id('rich_editor_customlayout_0020')
        .width('100%')
        .height(60)
        .borderWidth(1)
        .borderColor(Color.Gray)
        .backgroundColor(Color.White)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#ADd7E6')
    .justifyContent(FlexAlign.Center)
  }
}

@Entry
@Component
struct InterfaceCustomLayout0020 {

  build() {
    Column() {
      Text('Interface CustomLayout Padding Test')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      // 对自定义组件设置padding值
      CustomLayoutPaddingComponent()
        .padding({ top: 12, right: 18, bottom: 24, left: 30 })
        .id('custom_layout_padding_component_0020')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
    .padding(20)
  }
}
