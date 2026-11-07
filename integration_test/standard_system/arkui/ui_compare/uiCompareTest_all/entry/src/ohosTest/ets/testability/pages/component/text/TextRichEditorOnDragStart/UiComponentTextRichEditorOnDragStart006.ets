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
import { uniformTypeDescriptor, unifiedDataChannel, uniformDataStruct } from '@kit.ArkData';



// 导入RichEditor样式类型


@Entry
@Component
struct UiComponentTextRichEditorOnDragStart006 {
  // 左侧“可拖拽 RichEditor”的控制器
  controllerdrag: RichEditorController = new RichEditorController();
  controllerdrop: RichEditorController = new RichEditorController();
  optionsdrag: RichEditorOptions = { controller: this.controllerdrag };
  optionsdrop: RichEditorOptions = { controller: this.controllerdrop };
  // 统一文本样式（与“添加预置图文”的蓝色字体保持一致）
  textStyle: RichEditorTextStyle = {
    fontColor: Color.Blue, // 蓝色字体
    fontSize: 16, // 字体大小
  };
  // 统一图片样式（与“添加预置图文”的70px尺寸保持一致）
  imageStyle: RichEditorImageSpanStyle = {
    size: ['70px', '70px'], // 图片宽高
  };
  private my_builder: CustomBuilder = undefined

  @Builder
  TextBuilder() {
    Row() {
      Image($r('sys.media.ohos_app_icon')).width(50).height(50).margin(16)
    }.backgroundColor('#f4f4f4')
    .borderRadius('20')
    .width('100%')
  }

  build() {
    Column() {


      // 测试按钮：添加预置图文（用于验证样式一致性）
      Button('添加预置图文')
        .id('addSpanBtn006')
        .width('100%')
        .height(40)
        .backgroundColor('#4CAF50')
        .onClick(() => {
          this.controllerdrag.addBuilderSpan(this.my_builder)
          this.controllerdrag.addSymbolSpan($r('sys.symbol.basketball_fill'), {
            style: {
              fontSize: 30
            }
          })
          this.controllerdrag.addTextSpan('这里是add类测试文本', {
            style: {
              fontSize: 20,
              fontColor: Color.Blue
            }
          })
          this.controllerdrag.addImageSpan($r('sys.media.ohos_app_icon'), {
            imageStyle: {
              size: ['70px', '70px'],
            }
          })


        })
        .margin(10)

      // 图片选择按钮
      Button('选择图片类数据')
        .id('selectImage006')
        .width('100%')
        .height(40)
        .padding(16)
        .backgroundColor('#4CAF50')
        .onClick(() => {
          this.controllerdrag.setSelection(2, 13)
        })
        .margin(10)
      // 左侧：可拖拽的RichEditor（使用controller）
      RichEditor(this.optionsdrag)
        .id('richEditorDragOut006')
        .width('100%')
        .height(100)
        .border({ width: 1, color: Color.Gray })
        .borderRadius(8)
        .padding(8)
        .margin(10)
        .draggable(true)


      // 右侧：接收拖拽的RichEditor（使用controller）
      RichEditor(this.optionsdrop)
        .id('richEditorDropIn006')
        .width('100%')
        .height(200)
        .border({ width: 1, color: Color.Gray })
        .borderRadius(8)
        .padding(8)
        .margin(10)
        .allowDrop([
          uniformTypeDescriptor.UniformDataType.IMAGE,
          uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP,
          uniformTypeDescriptor.UniformDataType.TEXT,
          uniformTypeDescriptor.UniformDataType.PLAIN_TEXT
        ])
        .onDrop((event: DragEvent) => {
          event.setResult(0);
          this.receiveDragData(event);
        })

    }
    .width('100%').height('100%').padding(16).backgroundColor('#F6F7F9')
  }

  // 处理拖拽数据，应用统一样式
  async receiveDragData(event: DragEvent) {
    let dragData: unifiedDataChannel.UnifiedData = event.getData() as unifiedDataChannel.UnifiedData;
    if (dragData !== undefined) {
      let records: unifiedDataChannel.UnifiedRecord[] = dragData.getRecords();
      if (records.length > 0) {
        for (let i = 0; i < records.length; i++) {
          let types = records[i].getTypes();

          // 处理图片URI类型
          if (types.includes(uniformTypeDescriptor.UniformDataType.FILE_URI)) {
            const fileUriUds =
              records[i].getEntry(uniformTypeDescriptor.UniformDataType.FILE_URI) as uniformDataStruct.FileUri;
            let typeDescriptor = uniformTypeDescriptor.getTypeDescriptor(fileUriUds.fileType);
            if (typeDescriptor.belongsTo(uniformTypeDescriptor.UniformDataType.IMAGE)) {
              this.controllerdrop.addImageSpan(fileUriUds.oriUri, {
                imageStyle: this.imageStyle, // 应用统一图片样式
                offset: this.controllerdrop.getCaretOffset()
              })
            }
            continue;
          }

          // 处理纯文本类型
          if (types.includes(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT)) {
            const plainTextUds =
              records[i].getEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) as uniformDataStruct.PlainText;
            this.controllerdrop.addTextSpan(plainTextUds.textContent, {
              style: this.textStyle, // 应用统一文本样式
              offset: this.controllerdrop.getCaretOffset(),
            })
            continue;
          }

          // 处理PixelMap图片类型
          if (types.includes(uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP)) {
            const pixelMapUds =
              records[i].getEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP) as uniformDataStruct.PixelMap;
            this.controllerdrop.addImageSpan(pixelMapUds.pixelMap, {
              imageStyle: this.imageStyle, // 应用统一图片样式
              offset: this.controllerdrop.getCaretOffset()
            })
            continue;
          }
        }
      }
    }
  }
}