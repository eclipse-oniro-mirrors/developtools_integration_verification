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

interface ParamInfo0560 {
  info: string;
}

// PageFull1 组件 - 全屏页
@Component
export struct PageFull10560 {
  private navPathStack: NavPathStack = new NavPathStack();
  @State resultText: string = '';

  build() {
    NavDestination() {
      Column() {
        Text('PageFull1 页面')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20 })
        
        Text('全屏页面')
          .fontSize(16)
          .margin({ top: 10 })
          .fontColor('#666666')
        
        Text('页面跳转成功')
          .fontSize(14)
          .margin({ top: 20 })
          .fontColor('#4CAF50')
          .fontWeight(FontWeight.Bold)

        // 右侧分栏操作按钮
        Column({ space: 8 }) {
          Button('replacePath PageDetail1')
            .id('replacePageDetail1ButtonRight')
            .fontSize(13)
            .backgroundColor('#FF9800')
            .fontColor('#FFFFFF')
            .width('90%')
            .height(36)
            .margin({ top: 20 })
            .onClick(() => {
              try {
                let param: ParamInfo0560 = { info: 'ok' };
                (this.navPathStack as ESObject).replacePathByName('PageDetail1', param);
                this.resultText = '已执行 replacePath PageDetail1';
                console.info('[MultiNavigation0560] replacePath PageDetail1 from PageFull1');
              } catch (error) {
                this.resultText = `错误: ${error}`;
                console.error('[MultiNavigation0560] Error:', error);
              }
            })

          if (this.resultText) {
            Text(this.resultText)
              .fontSize(12)
              .fontColor('#666666')
              .margin({ top: 10 })
          }
        }
        .width('100%')
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#F0F4C3')
    }
    .title('PageFull1')
    .hideTitleBar(false)
    .onReady((context: NavDestinationContext) => {
      this.navPathStack = context.pathStack;
    })
  }
}

// PageDetail1 组件 - 详情页
@Component
export struct PageDetail10560 {
  private navPathStack: NavPathStack = new NavPathStack();
  @State resultText: string = '';

  build() {
    NavDestination() {
      Column() {
        Text('PageDetail1 页面')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20 })
        
        Text('详情页面')
          .fontSize(16)
          .margin({ top: 10 })
          .fontColor('#666666')
        
        Text('页面跳转成功')
          .fontSize(14)
          .margin({ top: 20 })
          .fontColor('#4CAF50')
          .fontWeight(FontWeight.Bold)

        // 右侧分栏操作按钮
        Column({ space: 8 }) {
          Button('replacePath PageHome1')
            .id('replacePageHome1ButtonRight')
            .fontSize(13)
            .backgroundColor('#2196F3')
            .fontColor('#FFFFFF')
            .width('90%')
            .height(36)
            .margin({ top: 20 })
            .onClick(() => {
              try {
                let param: ParamInfo0560 = { info: 'ok' };
                (this.navPathStack as ESObject).replacePathByName('PageHome1', param);
                this.resultText = '已执行 replacePath PageHome1';
                console.info('[MultiNavigation0560] replacePath PageHome1 from PageDetail1');
              } catch (error) {
                this.resultText = `错误: ${error}`;
                console.error('[MultiNavigation0560] Error:', error);
              }
            })

          if (this.resultText) {
            Text(this.resultText)
              .fontSize(12)
              .fontColor('#666666')
              .margin({ top: 10 })
          }
        }
        .width('100%')
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#FFEBEE')
    }
    .title('PageDetail1')
    .hideTitleBar(false)
    .onReady((context: NavDestinationContext) => {
      this.navPathStack = context.pathStack;
    })
  }
}

// PageHome1 组件 - 主页
@Component
export struct PageHome10560 {
  build() {
    NavDestination() {
      Column() {
        Text('PageHome1 页面')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20 })
        
        Text('主页面')
          .fontSize(16)
          .margin({ top: 10 })
          .fontColor('#666666')
        
        Text('页面跳转成功')
          .fontSize(14)
          .margin({ top: 20 })
          .fontColor('#4CAF50')
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#E3F2FD')
    }
    .title('PageHome1')
    .hideTitleBar(false)
  }
}

@Entry
@Component
export struct MultiNavigation0560 {
  @State resultText: string = '结果显示区域';
  private navPathStack: NavPathStack = new NavPathStack();

  @Builder
  PageMap(name: string) {
    if (name === 'PageFull1') {
      PageFull10560()
    } else if (name === 'PageDetail1') {
      PageDetail10560()
    } else if (name === 'PageHome1') {
      PageHome10560()
    }
  }

  build() {
    Column() {
      // 标题栏
      Row() {
        Text('MultiNavigation测试')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
      }
      .width('100%')
      .height('4.59%')
      .backgroundColor('#2196F3')
      .justifyContent(FlexAlign.Center)

      Scroll() {
        Column({ space: 8 }) {

          // 结果显示区域
          Column() {
            Text('结果显示')
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 5 })
              .alignSelf(ItemAlign.Start)

            Text(this.resultText)
              .id('resultText')
              .fontSize(12)
              .fontColor('#333333')
              .width('100%')
              .padding(8)
              .backgroundColor('#F5F5F5')
              .borderRadius(6)
              .height(60)
          }
          .width('95%')
          .padding(10)
          .backgroundColor('#FFFFFF')
          .borderRadius(8)

          // 操作按钮区域
          Column({ space: 6 }) {
            Button('pushPath PageFull1')
              .id('pushPageFull1Button')
              .fontSize(13)
              .backgroundColor('#FF9800')
              .fontColor('#FFFFFF')
              .width('100%')
              .height(36)
              .onClick(() => {
                try {
                  let param: ParamInfo0560 = { info: 'ok' };
                  this.navPathStack.pushPathByName('PageFull1', param);
                  this.resultText = '已跳转到 PageFull1 - 全屏页面';
                  console.info('[MultiNavigation0560] pushPath PageFull1');
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0560] Error:', error);
                }
              })

            Divider().strokeWidth(1).color('#E0E0E0').margin({ top: 5, bottom: 5 })

            Button('pop')
              .id('popButton')
              .fontSize(13)
              .backgroundColor('#9C27B0')
              .fontColor('#FFFFFF')
              .width('100%')
              .height(36)
              .onClick(() => {
                try {
                  this.navPathStack.pop();
                  const size = this.navPathStack.size();
                  this.resultText = `已执行 pop (当前栈大小:${size})`;
                  console.info('[MultiNavigation0560] pop, size:', size);
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0560] Error:', error);
                }
              })

            Button('getAllPathName')
              .id('getAllPathNameButton')
              .fontSize(13)
              .backgroundColor('#607d7B')
              .fontColor('#FFFFFF')
              .width('100%')
              .height(36)
              .onClick(() => {
                try {
                  const allPathNames = this.navPathStack.getAllPathName();
                  this.resultText = `当前栈内容：${allPathNames.join('，')} (共${allPathNames.length}个)`;
                  console.info('[MultiNavigation0560] getAllPathName:', allPathNames);
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0560] Error:', error);
                }
              })

            Button('size')
              .id('sizeButton')
              .fontSize(13)
              .backgroundColor('#795548')
              .fontColor('#FFFFFF')
              .width('100%')
              .height(36)
              .onClick(() => {
                try {
                  const stackSize = this.navPathStack.size();
                  this.resultText = `栈大小：${stackSize}`;
                  console.info('[MultiNavigation0560] size:', stackSize);
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0560] Error:', error);
                }
              })

            Button('重置测试')
              .fontSize(13)
              .backgroundColor('#F44336')
              .fontColor('#FFFFFF')
              .width('100%')
              .height(36)
              .onClick(() => {
                try {
                  this.navPathStack.clear();
                  this.resultText = '结果显示区域';
                  console.info('[MultiNavigation0560] 测试已重置');
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0560] Error:', error);
                }
              })
          }
          .width('95%')
          .padding(10)
          .backgroundColor('#FFFFFF')
          .borderRadius(8)
        }
        .width('100%')
        .padding({ top: 10, bottom: 10 })
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.None)

      // Navigation 组件区域
      Navigation(this.navPathStack) {
        Column() {
          Text('主页面')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 20 })
          
          Text('测试全屏页replace详情页,再replace主页')
            .fontSize(14)
            .margin({ top: 10 })
            .fontColor('#666666')
          
          Text('点击按钮依次跳转和替换')
            .fontSize(12)
            .margin({ top: 5 })
            .fontColor('#999999')
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
        .backgroundColor('#FFF9C4')
      }
      .navDestination(this.PageMap)
      .mode(NavigationMode.Stack)
      .height('28.69%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
