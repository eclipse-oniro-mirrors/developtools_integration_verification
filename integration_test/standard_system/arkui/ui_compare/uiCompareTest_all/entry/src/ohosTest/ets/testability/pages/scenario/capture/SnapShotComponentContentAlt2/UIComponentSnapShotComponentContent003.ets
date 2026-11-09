/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { image } from '@kit.ImageKit';
import { ComponentContent, NodeContent, typeNode } from '@kit.ArkUI';

const caseName: string = 'SUB_ACE_UI_COMPONENT_SNAPSHOT_COMPONENTCONTEN_0550';

@Builder
function buildImage() {
  Column() {
    Image('/openeye.png')
      .width('70%')
      .height('30%')
      .margin({ top: 10 })
  }
}

@Entry
@Component
struct UIComponentSnapShotComponentContent003 {
  @State delay: number | undefined = 300;
  @State checkImageStatus: boolean | undefined = true;
  @State snapShotScale: number = 2;
  @State waitUnitlRenFinished: boolean | undefined = true;
  @State pixmap: image.PixelMap | undefined = undefined;
  @State message: string | undefined | null = 'hello';
  uiContext: UIContext = this.getUIContext();
  private content: NodeContent = new NodeContent();

  build() {
    Row() {
      Column() {
        Button('点击生成ComponentContent组件')
          .id('click')
          .stateEffect(true)
          .onClick(() => {
            let column = typeNode.createNode(this.getUIContext(), 'Column');
            column.initialize();
            let uiContext = this.getUIContext();
            column.addComponentContent(new ComponentContent(uiContext,
              wrapBuilder(buildImage)));
            this.content.addFrameNode(column);
          })
          .margin({ top: 10 })
        ContentSlot(this.content);
        Button('切换参数')
          .id('change')
          .stateEffect(true)
          .onClick(() => {
            this.snapShotScale = 1;
            this.delay = undefined;
            this.checkImageStatus = undefined;
            this.waitUnitlRenFinished = undefined;
            console.info(`${caseName} snapShotScale is ${this.snapShotScale}`);
            console.info(`${caseName} delay is ${this.delay}`);
            console.info(`${caseName} checkImageStatus is ${this.checkImageStatus}`);
            console.info(`${caseName} waitUnitlRenFinished is ${this.waitUnitlRenFinished}`);
          })
          .margin({ top: 10 })
        Button('点击生成组件截图')
          .id('snapShot')
          .stateEffect(true)
          .onClick(() => {
            let uiContext = this.getUIContext();
            let contentNode = new ComponentContent(uiContext, wrapBuilder(buildImage));
            this.uiContext.getComponentSnapshot()
              .createFromComponent(contentNode, this.delay, this.checkImageStatus,
                { scale: this.snapShotScale, waitUntilRenderFinished: this.waitUnitlRenFinished })
              .then((pixmap: image.PixelMap) => {
                this.pixmap = pixmap;
              })
              .catch((err: Error) => {
                console.error(caseName + 'error: ' + err);
              })
          })
          .margin({ top: 10 })
        Image(this.pixmap)
          .margin(10)
          .width('70%')
          .height('30%')
          .border({ color: Color.Black, width: 2 })
      }
      .width('100%')
      .margin({ left: 10, top: 5, bottom: 5 })
    }
    .width('100%')
    .height('100%')
  }
}
