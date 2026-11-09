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
import { NodeController, FrameNode, typeNode } from '@kit.ArkUI';
class MyNodeController extends NodeController {
  private onAttachCallback: (() => void) | null = null;
  private onDetachCallback: (() => void) | null = null;
  private onAppearCallback: (() => void) | null = null;
  private onDisAppearCallback: (() => void) | null = null;
  setOnAttachCallback(callback: () => void) {
    this.onAttachCallback = callback;
  }
  setOnDetachCallback(callback: () => void) {
    this.onDetachCallback = callback;
  }
  setonAppear(callback: () => void) {
    this.onAppearCallback = callback;
  }
  setonDisAppearCallback(callback: () => void) {
    this.onDisAppearCallback = callback;
  }
  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext);
    node.commonAttribute.width(100)
      .height(50)
      .borderColor(Color.Gray)
      .borderWidth(1)
      .margin({ left: 10 });
    let col = typeNode.createNode(uiContext, 'Column');
    col.initialize({ space: 5 })
      .width('100%').height('100%').margin({ top: 5 });
    node.appendChild(col);
    let text = typeNode.createNode(uiContext, 'SymbolGlyph');
    text.initialize($r('sys.symbol.ohos_wifi'))
      .onAttach(() => {
        this.onAttachCallback?.();
      })
      .onDetach(() => {
        this.onDetachCallback?.();
      })
      .onDisAppear(()=>{
        this.onDisAppearCallback?.();
      })
      .onAppear(()=>{
        this.onAppearCallback?.();
      })
      .id('UiComponentSymbolGlyphFrameNode34')
    col.appendChild(text);
    return node;
  }
}

@Entry
@Component
struct UiComponentSymbolGlyphFrameNode34 {
  private myNodeController: MyNodeController = new MyNodeController();
  @State text :string ='SymbolGlyph set onAttach、onDetach、onAppear、onDisAppear event'
  @State text2 :string ='normal SymbolGlyph'
  @State textColor: Color = Color.Black;
  @State isAttached: boolean = false;
  @State attachCount: number = 0;
  @State detachCount: number = 0;
  @State onappear: number = 0;
  @State ondisappear: number = 0;
  @State isShow: boolean = false;
  @State changeAppear: string = '点我卸载挂载组件';
  aboutToAppear() {
    this.myNodeController.setOnAttachCallback(() => {
      this.isAttached = true;
      this.attachCount++;
    });

    this.myNodeController.setOnDetachCallback(() => {
      this.isAttached = false;
      this.detachCount++;
    });

    this.myNodeController.setonAppear(()=>{
      this.onappear++;
    });

    this.myNodeController.setonDisAppearCallback(()=>{
      this.ondisappear++;
    })
  }
  build() {
    Column() {
      Column(){
        Text(`挂载状态: ${this.isAttached ? '已挂载' : '已卸载'}`)
          .fontSize(14)
          .margin(10)
        Text(`挂载次数: ${this.attachCount}`)
          .fontSize(14)
          .margin(10)
        Text(`卸载次数: ${this.detachCount}`)
          .fontSize(14)
          .margin(10)
        Text(`onappear次数: ${this.onappear}`)
          .fontSize(14)
          .margin(10)
        Text(`ondisappear次数: ${this.ondisappear}`)
          .fontSize(14)
          .margin(10)
        Button(this.changeAppear)
          .onClick(() => {
            this.isShow = !this.isShow;
          })
          .margin(15)
          .id('UiComponentSymbolGlyphFrameNode34_02')
      }
      .width('100%')
      if(this.isShow) {
        NodeContainer(this.myNodeController);
      }
    }
  }
}
