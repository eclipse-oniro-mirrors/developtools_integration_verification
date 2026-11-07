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

import { ComponentContent, NodeContent, typeNode } from '@kit.ArkUI';
import { image } from '@kit.ImageKit';

interface ParamsInterface {
  text: string;
}

@Builder
function buildText(params: ParamsInterface) {
  Text(params.text)
    .fontSize(12)
    .fontWeight(FontWeight.Normal)
    .margin({ bottom: 8 })
    .textAlign(TextAlign.Center)
    .width('100%')
}

@Entry
@Component
struct SnapshotComponentContent0370 {
  @State message: string = 'HELLO';
  private content: NodeContent = new NodeContent();
  private componentContent: ComponentContent<ParamsInterface> | null = null;
  @State pixmap: image.PixelMap | undefined = undefined;

  build() {
    Row() {
      Column() {
        Button('addComponentContent')
          .id('btn')
          .onClick(() => {
            // 创建ComponentContent，使用Text组件
            this.componentContent = new ComponentContent<ParamsInterface>(this.getUIContext(),
              wrapBuilder<[ParamsInterface]>(buildText), {
                text: this.message
              });
            
            let column = typeNode.createNode(this.getUIContext(), 'Column');
            column.initialize();
            column.addComponentContent(this.componentContent);
            this.content.addFrameNode(column);
            
            // 自动执行更新文本和截图流程
            setTimeout(() => {
              if (this.componentContent) {
                // 使用update修改text组件的内容
                this.componentContent.update({ text: '更新后的文本' });
                
                // 延迟一下再截图，确保更新完成
                setTimeout(() => {
                  if (this.componentContent) {
                    // 调用createFromComponent接口获取ComponentContent的截图
                    this.getUIContext().getComponentSnapshot()
                      .createFromComponent(this.componentContent, 320, true, { scale: 2, waitUntilRenderFinished: true })
                      .then((pixmap: image.PixelMap) => {
                        this.pixmap = pixmap;
                        console.info('截图成功');
                      })
                      .catch((err: Error) => {
                        console.error('截图失败: ' + err);
                      })
                  }
                }, 100);
              }
            }, 100);
          })
          .margin({ bottom: 20 })
        
        Button('updateText')
          .onClick(() => {
            if (this.componentContent) {
              // 使用update修改text组件的内容
              this.componentContent.update({ text: '更新后的文本' });
            }
          })
          .margin({ bottom: 20 })
        
        Button('takeSnapshot')
          .onClick(() => {
            if (this.componentContent) {
              // 调用createFromComponent接口获取ComponentContent的截图
              this.getUIContext().getComponentSnapshot()
                .createFromComponent(this.componentContent, 320, true, { scale: 2, waitUntilRenderFinished: true })
                .then((pixmap: image.PixelMap) => {
                  this.pixmap = pixmap;
                  console.info('截图成功');
                })
                .catch((err: Error) => {
                  console.error('截图失败: ' + err);
                })
            }
          })
          .margin({ bottom: 20 })
        
        ContentSlot(this.content)
        
        if (this.pixmap) {
          Image(this.pixmap)
            .margin(10)
            .height(300)
            .width(300)
            .border({ color: Color.Black, width: 2 })
        }
      }
      .id('column')
      .width('100%')
      .height('100%')
    }
    .height('100%')
  }
}