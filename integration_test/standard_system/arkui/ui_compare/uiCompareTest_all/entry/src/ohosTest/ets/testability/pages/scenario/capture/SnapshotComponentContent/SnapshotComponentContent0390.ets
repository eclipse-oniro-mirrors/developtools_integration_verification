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
struct SnapshotComponentContent0390 {
  @State message: string = 'HELLO';
  private content: NodeContent = new NodeContent();
  private componentContent: ComponentContent<ParamsInterface> | null = null;
  @State pixmap: image.PixelMap | undefined = undefined;
  @State isDisposed: boolean = false;

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
            
            // 自动执行dispose和截图流程
            setTimeout(() => {
              if (this.componentContent) {
                // 保存引用用于测试
                const disposedContent = this.componentContent;
                
                // 使用dispose销毁ComponentContent
                disposedContent.dispose();
                this.componentContent = null; // 销毁后设置为null
                this.isDisposed = true;
                console.info('ComponentContent已销毁');
                
                // 延迟一下再截图，确保销毁完成
                setTimeout(() => {
                  // 使用已销毁的对象进行截图测试（预期失败）
                  try {
                    this.getUIContext().getComponentSnapshot()
                      .createFromComponent(disposedContent, 320, true, { scale: 2, waitUntilRenderFinished: true })
                      .then((pixmap: image.PixelMap) => {
                        this.pixmap = pixmap;
                        console.info('截图成功（意外）');
                      })
                      .catch((err: Error) => {
                        console.error('截图失败（预期的）: ' + JSON.stringify(err));
                        // 预期这里会报错401
                      })
                  } catch (error) {
                    console.error('截图调用失败（预期的）: ' + error);
                  }
                }, 100);
              }
            }, 100);
          })
          .margin({ bottom: 20 })
        
        Button('disposeComponent')
          .onClick(() => {
            if (this.componentContent && !this.isDisposed) {
              // 使用dispose销毁ComponentContent
              this.componentContent.dispose();
              this.isDisposed = true;
              console.info('ComponentContent已销毁');
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
                  if (this.isDisposed) {
                    console.info('截图失败原因：ComponentContent已被销毁');
                  }
                })
            } else {
              console.error('没有可用的ComponentContent');
            }
          })
          .margin({ bottom: 20 })
        
        Text(`ComponentContent状态: ${this.isDisposed ? '已销毁' : '正常'}`)
          .fontSize(14)
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