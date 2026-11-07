/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import inputMethod from '@ohos.inputMethod';

@Entry
@Component
struct DragDemo {
  @State searchText: string = '初始搜索词'
  @State textContent: string = '示例文本数据'
  @State dragPreviewOffsetY: number = 0  // 拖拽缩略图偏移量
  @State focusColor: string = '#FFFFFF'  // Search组件焦点态

  build() {
    Column({ space: 20 }) {
      // 可拖拽Text组件
      Text(this.textContent)
        .copyOption(CopyOptions.InApp)
        .draggable(true)
        .fontSize(18)
        .padding(10)
        .backgroundColor('#F5F5F5')
        .onDragStart((event: DragEvent) => {
          // 设置拖拽数据
          const data = new unifiedDataChannel.UnifiedData()
          data.addRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, this.textContent)
          event.setData(data)

          // 自定义缩略图位置
          this.dragPreviewOffsetY = 8
          event.setDragPreview(this.customPreviewBuilder(), {
            offset: { x: 0, y: this.dragPreviewOffsetY }
          })
        })

      // 可落入Search组件
      Search({
        value: this.searchText,
        placeholder: '拖入文本进行搜索'
      })
        .copyOption(CopyOptions.InApp)
        .allowDrop([uniformTypeDescriptor.UniformDataType.PLAIN_TEXT])
        .backgroundColor(this.focusColor)
        .onFocus(() => {
          this.focusColor = '#E3F2FD' // 获焦时浅蓝背景
          inputMethod.getController().showTextInput()
        })
        .onBlur(() => this.focusColor = '#FFFFFF')
        .onDrop((event: DragEvent) => {
          const data = event.getData()
          const records = data.getRecords()
          if (records[0].type === uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
            this.searchText = records[0].plainText
          }
        })
    }
    .width('100%')
    .padding(20)
  }

  // 自定义拖拽缩略图
  @Builder
  customPreviewBuilder() {
    Text(this.textContent.substring(0,10))
      .fontSize(14)
      .padding(8)
      .backgroundColor('#FFFFFF')
      .border({ color: '#2196F3', width: 2 })
  }
}