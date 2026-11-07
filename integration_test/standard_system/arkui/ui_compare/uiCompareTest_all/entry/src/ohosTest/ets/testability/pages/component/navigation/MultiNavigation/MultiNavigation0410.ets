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

interface ParamInfo0410 {
  info: string;
}

// PageHome2 组件
@Component
export struct PageHome20410 {
  build() {
    NavDestination() {
      Column() {
        Text('PageHome2 页面')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20 })
        
        Text('这是 PageHome2 的内容')
          .fontSize(16)
          .margin({ top: 10 })
          .fontColor('#666666')
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#E8F5E9')
    }
    .title('PageHome2')
    .hideTitleBar(false)
  }
}

// PageDetail1 组件
@Component
export struct PageDetail10410 {
  build() {
    NavDestination() {
      Column() {
        Text('PageDetail1 页面')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20 })
        
        Text('这是 PageDetail1 的内容')
          .fontSize(16)
          .margin({ top: 10 })
          .fontColor('#666666')
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#FFEBEE')
    }
    .title('PageDetail1')
    .hideTitleBar(false)
  }
}

// PageDetail2 组件
@Component
export struct PageDetail20410 {
  build() {
    NavDestination() {
      Column() {
        Text('PageDetail2 页面')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20 })
        
        Text('这是 PageDetail2 的内容')
          .fontSize(16)
          .margin({ top: 10 })
          .fontColor('#666666')
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#FFF3E0')
    }
    .title('PageDetail2')
    .hideTitleBar(false)
  }
}

@Entry
@Component
export struct MultiNavigation0410 {
  @State resultText: string = '结果显示区域';
  @State indexInput: string = '';
  private navPathStack: NavPathStack = new NavPathStack();

  @Builder
  PageMap(name: string) {
    if (name === 'PageHome2') {
      PageHome20410()
    } else if (name === 'PageDetail1') {
      PageDetail10410()
    } else if (name === 'PageDetail2') {
      PageDetail20410()
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
            Button('pushPath PageDetail2')
              .id('pushPageDetail2Button')
              .fontSize(13)
              .backgroundColor('#2196F3')
              .fontColor('#FFFFFF')
              .width('100%')
              .height(36)
              .onClick(() => {
                try {
                  let param: ParamInfo0410 = { info: 'ok' };
                  this.navPathStack.pushPathByName('PageDetail2', param);
                  this.resultText = '已添加 PageDetail2';
                  console.info('[MultiNavigation0410] pushPath PageDetail2');
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0410] Error:', error);
                }
              })

            Button('pushPath PageDetail1')
              .id('pushPageDetail1Button')
              .fontSize(13)
              .backgroundColor('#2196F3')
              .fontColor('#FFFFFF')
              .width('100%')
              .height(36)
              .onClick(() => {
                try {
                  let param: ParamInfo0410 = { info: 'ok' };
                  this.navPathStack.pushPathByName('PageDetail1', param);
                  this.resultText = '已添加 PageDetail1';
                  console.info('[MultiNavigation0410] pushPath PageDetail1');
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0410] Error:', error);
                }
              })

            Button('pushPath PageHome2')
              .id('pushPageHome2Button')
              .fontSize(13)
              .backgroundColor('#4CAF50')
              .fontColor('#FFFFFF')
              .width('100%')
              .height(36)
              .onClick(() => {
                try {
                  let param: ParamInfo0410 = { info: 'ok' };
                  this.navPathStack.pushPathByName('PageHome2', param);
                  this.resultText = '已添加 PageHome2';
                  console.info('[MultiNavigation0410] pushPath PageHome2');
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0410] Error:', error);
                }
              })

            Divider().strokeWidth(1).color('#E0E0E0').margin({ top: 5, bottom: 5 })

            // 索引输入区域
            Row() {
              Text('索引:')
                .fontSize(13)
                .width(50)
              
              TextInput({ placeholder: '输入索引', text: this.indexInput })
                .id('indexInput')
                .fontSize(13)
                .height(36)
                .layoutWeight(1)
                .onChange((value: string) => {
                  this.indexInput = value;
                  console.info('[MultiNavigation0410] indexInput:', value);
                })
            }
            .width('100%')

            Button('moveIndexToTop')
              .id('moveIndexToTopButton')
              .fontSize(13)
              .backgroundColor('#FF9800')
              .fontColor('#FFFFFF')
              .width('100%')
              .height(36)
              .onClick(() => {
                try {
                  const index = parseInt(this.indexInput);
                  if (isNaN(index)) {
                    this.resultText = '错误: 请输入有效的数字';
                    return;
                  }
                  this.navPathStack.moveIndexToTop(index);
                  this.resultText = `已执行 moveIndexToTop(${index})`;
                  console.info('[MultiNavigation0410] moveIndexToTop:', index);
                } catch (error) {
                  this.resultText = `错误: ${error} - 页面无法跳转`;
                  console.error('[MultiNavigation0410] Error:', error);
                }
              })

            Divider().strokeWidth(1).color('#E0E0E0').margin({ top: 5, bottom: 5 })

            Button('getAllPathName')
              .id('getAllPathNameButton')
              .fontSize(13)
              .backgroundColor('#9C27B0')
              .fontColor('#FFFFFF')
              .width('100%')
              .height(36)
              .onClick(() => {
                try {
                  const allPathNames = this.navPathStack.getAllPathName();
                  this.resultText = `当前栈内容：${allPathNames.join('，')} (共${allPathNames.length}个)`;
                  console.info('[MultiNavigation0410] getAllPathName:', allPathNames);
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0410] Error:', error);
                }
              })

            Button('size')
              .id('sizeButton')
              .fontSize(13)
              .backgroundColor('#607d7B')
              .fontColor('#FFFFFF')
              .width('100%')
              .height(36)
              .onClick(() => {
                try {
                  const stackSize = this.navPathStack.size();
                  this.resultText = `栈大小：${stackSize}`;
                  console.info('[MultiNavigation0410] size:', stackSize);
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0410] Error:', error);
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
                  this.indexInput = '';
                  this.resultText = '结果显示区域';
                  console.info('[MultiNavigation0410] 测试已重置');
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0410] Error:', error);
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
          Text('MultiNavigation 主页面')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 20 })
          
          Text('测试moveIndexToTop')
            .fontSize(14)
            .margin({ top: 10 })
            .fontColor('#666666')
          
          Text('超大索引值应无法跳转')
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
      .height('24.59%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
