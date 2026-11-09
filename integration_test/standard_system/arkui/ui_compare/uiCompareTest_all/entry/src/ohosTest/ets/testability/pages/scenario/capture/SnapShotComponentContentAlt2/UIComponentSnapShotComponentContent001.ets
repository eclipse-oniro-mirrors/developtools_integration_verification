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

class Params {
  text: string | undefined | null  = '';

  constructor(text: string | undefined | null ) {
    this.text = text;
  }
}

@Builder
function buildText(params: Params) {
  ReusableChildComponent({ text: params.text })
}

@Component
struct ReusableChildComponent {
  @Prop text: string | undefined | null  = '';

  aboutToReuse(params: Record<string, object>) {
    console.log('ReusableChildComponent Reusable ' + JSON.stringify(params));
  }

  aboutToRecycle(): void {
    console.log('ReusableChildComponent aboutToRecycle ' + this.text);
  }

  build() {
    Column() {
      Text(this.text)
        .fontSize(40)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Green)
        .margin({ bottom: 10, top: 10 })
    }
    .backgroundColor('#FFF0F0F0')
  }
}

@Entry
@Component
struct UIComponentSnapShotComponentContent001 {
  @State pixmap: image.PixelMap | undefined = undefined;
  @State message: string | undefined | null = 'hello';
  uiContext: UIContext = this.getUIContext();
  private content: NodeContent = new NodeContent();

  build() {
    Row() {
      Column() {
        Column() {
          Button('点击生成ComponentContent组件')
            .id('click')
            .stateEffect(true)
            .onClick(() => {
              let column = typeNode.createNode(this.getUIContext(), 'Column');
              column.initialize();
              let uiContext = this.getUIContext();
              column.addComponentContent(new ComponentContent(uiContext,
                wrapBuilder(buildText), new Params(this.message), { nestingBuilderSupported: true }));
              this.content.addFrameNode(column);
            })
          ContentSlot(this.content);
        }
        .height('45%')
        Column() {
          Button('点击生成组件截图')
            .id('snapShot')
            .onClick(() => {
              let uiContext = this.getUIContext();
              let contentNode = new ComponentContent(uiContext, wrapBuilder(buildText), new Params(this.message));
              this.uiContext.getComponentSnapshot()
                .createFromComponent(contentNode, 320, true, { scale: 1, waitUntilRenderFinished: true })
                .then((pixmap: image.PixelMap) => {
                  this.pixmap = pixmap;
                })
                .catch((err: Error) => {
                  console.error('error: ' + err);
                })
            })
          Image(this.pixmap)
            .margin(10)
            .height('90%')
            .width('90%')
            .border({ color: Color.Black, width: 2 })
        }
        .height('45%')
      }
      .margin({ left: 10, top: 5, bottom: 5 })
    }
  }
}
