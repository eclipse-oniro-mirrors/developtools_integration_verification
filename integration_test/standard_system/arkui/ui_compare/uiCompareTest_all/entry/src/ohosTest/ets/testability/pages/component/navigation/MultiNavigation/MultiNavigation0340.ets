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

interface ParamInfo0340 {
  info: string;
}

// PageHome1 组件
@Component
export struct PageHome10340 {
  build() {
    NavDestination() {
      Column() {
        Text('PageHome1 页面')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20 })
        
        Text('这是栈底页面')
          .fontSize(16)
          .margin({ top: 10 })
          .fontColor('#4CAF50')
        
        Text('(setKeepBottomPage后pop无法删除)')
          .fontSize(12)
          .margin({ top: 5 })
          .fontColor('#999999')
        
        Text('(但removeByName可以删除)')
          .fontSize(12)
          .margin({ top: 2 })
          .fontColor('#FF5722')
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

// PageDetail1 组件
@Component
export struct PageDetail10340 {
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

@Entry
@Component
export struct MultiNavigation0340 {
  @State resultText: string = '结果显示区域';
  @State keepBottomPageSet: boolean = false;
  private navPathStack: NavPathStack = new NavPathStack();

  aboutToAppear() {
    // 初始化时添加PageHome1作为栈底页面
    try {
      let param: ParamInfo0340 = { info: 'ok' };
      let params: Array<string | ParamInfo0340> = ['paramTest', param];
      this.navPathStack.pushPathByName('PageHome1', params);
      console.info('[MultiNavigation0340] 初始化: 已添加PageHome1作为栈底');
      
      // 再添加一个PageDetail1
      this.navPathStack.pushPathByName('PageDetail1', param);
      console.info('[MultiNavigation0340] 初始化: 已添加PageDetail1');
    } catch (error) {
      console.error('[MultiNavigation0340] 初始化错误:', error);
    }
  }

  @Builder
  PageMap(name: string) {
    if (name === 'PageHome1') {
      PageHome10340()
    } else if (name === 'PageDetail1') {
      PageDetail10340()
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
            Button('setKeepBottomPage true')
              .id('setKeepBottomPageButton')
              .fontSize(13)
              .backgroundColor(this.keepBottomPageSet ? '#4CAF50' : '#FF9800')
              .fontColor('#FFFFFF')
              .width('100%')
              .height(36)
              .onClick(() => {
                try {
                  // 使用类型断言调用 setKeepBottomPage
                  (this.navPathStack as ESObject).setKeepBottomPage(true);
                  this.keepBottomPageSet = true;
                  this.resultText = '已设置 setKeepBottomPage true';
                  console.info('[MultiNavigation0340] setKeepBottomPage true');
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0340] Error:', error);
                }
              })

            Button('pop')
              .id('popButton')
              .fontSize(13)
              .backgroundColor('#2196F3')
              .fontColor('#FFFFFF')
              .width('100%')
              .height(36)
              .onClick(() => {
                try {
                  this.navPathStack.pop();
                  const size = this.navPathStack.size();
                  this.resultText = `已执行 pop${this.keepBottomPageSet ? ' - 栈底页面无法删除' : ''} (当前栈大小:${size})`;
                  console.info('[MultiNavigation0340] pop executed, size:', size);
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0340] Error:', error);
                }
              })

            Button('removeByName PageHome1')
              .id('removeByNameButton')
              .fontSize(13)
              .backgroundColor('#9C27B0')
              .fontColor('#FFFFFF')
              .width('100%')
              .height(36)
              .onClick(() => {
                try {
                  this.navPathStack.removeByName('PageHome1');
                  const size = this.navPathStack.size();
                  this.resultText = `已执行 removeByName PageHome1 - 页面可删除 (当前栈大小:${size})`;
                  console.info('[MultiNavigation0340] removeByName PageHome1, size:', size);
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0340] Error:', error);
                }
              })

            Divider().strokeWidth(1).color('#E0E0E0').margin({ top: 5, bottom: 5 })

            Button('getAllPathName')
              .id('getAllPathNameButton')
              .fontSize(13)
              .backgroundColor('#4CAF50')
              .fontColor('#FFFFFF')
              .width('100%')
              .height(36)
              .onClick(() => {
                try {
                  const allPathNames = this.navPathStack.getAllPathName();
                  this.resultText = `当前栈内容：${allPathNames.join('，')} (共${allPathNames.length}个)`;
                  console.info('[MultiNavigation0340] getAllPathName:', allPathNames);
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0340] Error:', error);
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
                  console.info('[MultiNavigation0340] size:', stackSize);
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0340] Error:', error);
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
                  // 重新添加初始页面
                  let param: ParamInfo0340 = { info: 'ok' };
                  let params: Array<string | ParamInfo0340> = ['paramTest', param];
                  this.navPathStack.pushPathByName('PageHome1', params);
                  this.navPathStack.pushPathByName('PageDetail1', param);
                  this.keepBottomPageSet = false;
                  this.resultText = '结果显示区域';
                  console.info('[MultiNavigation0340] 测试已重置');
                } catch (error) {
                  this.resultText = `错误: ${error}`;
                  console.error('[MultiNavigation0340] Error:', error);
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
          
          Text('初始栈: PageHome1 + PageDetail1')
            .fontSize(14)
            .margin({ top: 10 })
            .fontColor('#666666')
          
          Text('测试setKeepBottomPage后pop和remove')
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
