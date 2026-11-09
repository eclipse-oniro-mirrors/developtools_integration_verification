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

import { SymbolGlyphModifier } from '@kit.ArkUI';

@Component
struct MyPageOne {
  private listScroller: Scroller = new Scroller();
  private scrollScroller: Scroller = new Scroller();
  private arr: number[] = [];

  aboutToAppear(): void {
    for (let i = 0; i < 30; i++) {
      this.arr.push(i);
    }
  }

  build() {
    NavDestination() {
      Scroll(this.scrollScroller) {
        Column() {
          List({ space: 0, initialIndex: 0, scroller: this.listScroller }) {
            ForEach(this.arr, (item: number, index: number) => {
              ListItem() {
                Text('' + item)
                  .height(100)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .width('90%')
                  .margin({ left: '5%' })
                  .borderRadius(10)
                  .backgroundColor(Color.Gray)
              }
            }, (item: string) => item);
          }.width('100%').height('80%').scrollBar(BarState.Off)
          .nestedScroll({ scrollForward: NestedScrollMode.SELF_FIRST, scrollBackward: NestedScrollMode.SELF_FIRST })

          ForEach(this.arr, (item: number, index: number) => {
            ListItem() {
              Text('' + item)
                .height(100)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .width('90%')
                .margin({ top: '5%' })
                .borderRadius(10)
                .backgroundColor(Color.Pink)
            }
          }, (item: string) => item);
        }
      }
      .width('100%')
      .scrollBar(BarState.Off)
      .scrollable(ScrollDirection.Vertical)
      .edgeEffect(EdgeEffect.Spring)
    }
    .title('页面一标题', {
      backgroundColor: '#4CAF50',  // 修改标题背景色为绿色
      barStyle: BarStyle.STANDARD   // 修改为标准样式
    })
    .hideTitleBar(false) // 显示标题栏
    .hideToolBar(false) // 显示工具栏
    .mode(NavDestinationMode.STANDARD) // 标准模式
    .backButtonIcon($r('sys.symbol.chevron_left')) // 自定义返回按钮图标
    .menus([
      // 添加菜单项
      {
        value: '菜单1',
        icon: $r('sys.symbol.star'),
        action: () => {
          console.info('菜单1被点击');
        }
      },
      {
        value: '菜单2',
        icon: $r('sys.symbol.heart'),
        action: () => {
          console.info('菜单2被点击');
        }
      }
    ])
    .toolbarConfiguration([
      {
        value: '工具1',
        symbolIcon: new SymbolGlyphModifier($r('sys.symbol.phone'))
      },
      {
        value: '工具2',
        symbolIcon: new SymbolGlyphModifier($r('sys.symbol.message'))
      },
      {
        value: '工具3',
        symbolIcon: new SymbolGlyphModifier($r('sys.symbol.camera'))
      }
    ], {
      backgroundColor: '#FF9800',  // 修改工具栏背景色为橙色
      barStyle: BarStyle.STANDARD  // 修改为标准样式
    })
    .onBackPressed(() => {
      // 自定义返回按钮行为
      console.info('PageOne 返回按钮被点击');
      return false; // 返回false表示不拦截,继续执行默认返回
    })
    .onShown(() => {
      console.info('PageOne 已显示');
    })
    .onHidden(() => {
      console.info('PageOne 已隐藏');
    })
    // 绑定有父子关系的可滚动容器组件
    .bindToNestedScrollable([{ parent: this.scrollScroller, child: this.listScroller }])
  }
}

@Component
struct MyPageTwo {
  private listScroller: Scroller = new Scroller();
  private arr: number[] = [];

  aboutToAppear(): void {
    for (let i = 0; i < 30; i++) {
      this.arr.push(i);
    }
  }

  build() {
    NavDestination() {
      List({ scroller: this.listScroller }) {
        ForEach(this.arr, (item: number, index: number) => {
          ListItem() {
            Text('' + item)
              .height(100)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .width('90%')
              .margin({ left: '5%' })
              .borderRadius(10)
              .backgroundColor(Color.Gray)
          }
        }, (item: string) => item);
      }.width('100%')
    }
    .title({ main: '页面二主标题', sub: '副标题' }, {
      backgroundColor: '#2196F3',  // 修改标题背景色为蓝色
      barStyle: BarStyle.STACK      // 堆叠样式
    })
    .hideTitleBar(false) // 显示标题栏
    .hideToolBar(true) // 隐藏工具栏
    .mode(NavDestinationMode.DIALOG) // 对话框模式
    .backButtonIcon($r('sys.symbol.xmark')) // 自定义返回按钮为关闭图标
    .menus([
      // 添加不同的菜单项(使用存在的图标)
      {
        value: '菜单1',
        icon: $r('sys.symbol.star'),
        action: () => {
          console.info('菜单1被点击');
        }
      },
      {
        value: '菜单2',
        icon: $r('sys.symbol.heart'),
        action: () => {
          console.info('菜单2被点击');
        }
      },
      {
        value: '菜单3',
        icon: $r('sys.symbol.phone_badge_star'),
        action: () => {
          console.info('菜单3被点击');
        }
      }
    ])
    .toolbarConfiguration([
      {
        value: '工具1',
        symbolIcon: new SymbolGlyphModifier($r('sys.symbol.phone'))
      },
      {
        value: '工具2',
        symbolIcon: new SymbolGlyphModifier($r('sys.symbol.message'))
      }
    ], {
      backgroundColor: '#E91E63',  // 粉红色背景
      barStyle: BarStyle.STANDARD
    })
    .onBackPressed(() => {
      // 自定义返回按钮行为
      console.info('PageTwo 返回按钮被点击');
      return false; // 返回false表示不拦截,允许正常返回
    })
    .onShown(() => {
      console.info('PageTwo 已显示');
    })
    .onHidden(() => {
      console.info('PageTwo 已隐藏');
    })
    .onReady((context: NavDestinationContext) => {
      console.info('PageTwo NavDestination 已准备好');
    })
    // 绑定可滚动容器组件
    .bindToScrollable([this.listScroller])
  }
}

@Entry
@Component
struct PreviewBasic0100 {
  private stack: NavPathStack = new NavPathStack();

  @Builder
  MyPageMap(name: string) {
    if (name === 'myPageOne') {
      MyPageOne();
    } else {
      MyPageTwo();
    }
  }

  build() {
    Navigation(this.stack) {
      Column() {
        Button('push PageOne').onClick(() => {
          this.stack.pushPath({ name: 'myPageOne' });
        })
        Button('push PageTwo').onClick(() => {
          this.stack.pushPath({ name: 'myPageTwo' });
        })
      }.height('40%').justifyContent(FlexAlign.SpaceAround)
    }.width('100%')
    .height('100%')
    .title({ main: 'MainTitle', sub: 'subTitle' })
    .navDestination(this.MyPageMap)
  }
}


