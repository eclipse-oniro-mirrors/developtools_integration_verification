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


import { ComponentContent } from '@kit.ArkUI';
// 定义数据结构
interface TimeTable {
  title: string;
  projects: string[];
}

class ProjectsDataSource implements IDataSource {
  private dataArray: string[] = [];
  private listeners: DataChangeListener[] = [];

  constructor(dataArray: string[]) {
    this.dataArray = dataArray;
  }

  totalCount(): number {
    return this.dataArray.length;
  }

  getData(index: number): string {
    return this.dataArray[index];
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      this.listeners.splice(pos, 1);
    }
  }
}

class TimeTableDataSource implements IDataSource {
  private dataArray: TimeTable[] = [];
  private listeners: DataChangeListener[] = [];

  constructor(dataArray: TimeTable[]) {
    this.dataArray = dataArray;
  }

  totalCount(): number {
    return this.dataArray.length;
  }

  getData(index: number): TimeTable {
    return this.dataArray[index];
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      this.listeners.splice(pos, 1);
    }
  }
}

class HeadBuilderParams {
  text: string | Resource;

  constructor(text: string | Resource) {
    this.text = text;
  }
}

class FootBuilderParams {
  num: number | Resource;

  constructor(num: number | Resource) {
    this.num = num;
  }
}

// 移除未使用的函数

@Component
struct MyItemGroup {
  item: TimeTable = { title: '', projects: [] };
  header?: ComponentContent<HeadBuilderParams> = undefined;
  footer?: ComponentContent<FootBuilderParams> = undefined;
  headerParam = new HeadBuilderParams(this.item.title);
  footerParam = new FootBuilderParams(this.item.projects.length);
  itemArr: ProjectsDataSource = new ProjectsDataSource([]);

  aboutToAppear(): void {
    // 简化组件内容创建
    this.itemArr = new ProjectsDataSource(this.item.projects);
  }

  @Builder
  GetHeader() {
    Text(this.item.title)
      .fontSize(20)
      .height('48vp')
      .width('100%')
      .padding(10)
      .backgroundColor($r('sys.color.background_tertiary'))
  }

  @Builder
  GetFooter() {
    Text('共' + this.item.projects.length.toString() + '节课')
      .fontSize(20)
      .height('48vp')
      .width('100%')
      .padding(10)
      .backgroundColor($r('sys.color.background_tertiary'))
  }

  build() {
    ListItemGroup({
      header: this.GetHeader,
      footer: this.GetFooter,
      // 根据官方文档添加更多属性
      space: 8,  // 设置子组件间距
      style: ListItemGroupStyle.CARD  // 设置卡片样式
    }) {
      LazyForEach(this.itemArr, (project: string, index: number) => {
        ListItem() {
          // 修改ListItem样式以适应多列布局
          Column() {
            Text(project)
              .fontSize(18)
              .textAlign(TextAlign.Center)
              .fontWeight(FontWeight.Medium)
              .fontColor(0x333333)

            Text(`第${index + 1}节`)
              .fontSize(12)
              .fontColor(0x666666)
              .margin({ top: 4 })
          }
          .width('100%')
          .height('6.97%')
          .padding(12)
          .justifyContent(FlexAlign.Center)
          .backgroundColor(Color.White)
          .borderRadius(8)
          .border({
            width: 1,
            color: 0xE0E0E0
          })
          .shadow({
            radius: 6,
            color: '#10000000',
            offsetX: 0,
            offsetY: 3
          })
        }
        // 根据官方文档设置 ListItem 属性
        .selectable(true)
        .selected(false)
        // .swipeAction 暂时注释，避免语法错误
        // .swipeAction({
        //   end: () => {
        //     // 滑动操作区域
        //   }
        // })
      }, (item: string, index: number) => `${item}-${index}`)
    }
    // 根据官方文档设置完整的 ListItemGroup 属性
    .divider({
      strokeWidth: 1,
      color: 0xE5E5E5,
      startMargin: 16,
      endMargin: 16
    })
    // .childrenMainSize(ListItemGroupChildrenMainSize.SPACE_EVENLY)  // 此属性可能不支持，注释掉
    .backgroundColor(0xF8F9FA)
    .borderRadius(12)
    .padding({ left: 8, right: 8, top: 4, bottom: 4 })
    .margin({ left: 8, right: 8, top: 4, bottom: 4 })
    .shadow({
      radius: 8,
      color: '#15000000',
      offsetX: 0,
      offsetY: 4
    })
  }
}

@Entry
@Component
struct PreviewContainer0070 {
  itemGroupArray: TimeTableDataSource = new TimeTableDataSource([]);

  aboutToAppear(): void {
    let timeTable: TimeTable[] = [
      {
        title: '星期一',
        projects: ['语文', '数学', '英语', '物理', '化学', '生物']
      },
      {
        title: '星期二',
        projects: ['历史', '地理', '政治', '体育', '美术', '音乐']
      },
      {
        title: '星期三',
        projects: ['计算机', '编程', '算法', '数据结构', '网络']
      },
      {
        title: '星期四',
        projects: ['文学', '写作', '阅读', '书法']
      },
      {
        title: '星期五',
        projects: ['实验', '生活', '奥数', '高数', '中医']
      }
    ];
    this.itemGroupArray = new TimeTableDataSource(timeTable);
  }

  build() {
    Column({ space: 16 }) {
      // 标题区域
      Column({ space: 8 }) {
        Text('课程表 - ListItemGroup 示例')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
          .fontColor(0x333333)
          .textAlign(TextAlign.Center)

        Text('展示 ListItemGroup 的完整属性配置')
          .fontSize(14)
          .fontColor(0x666666)
          .textAlign(TextAlign.Center)
      }
      .width('100%')
      .padding(16)
      .backgroundColor(Color.White)
      .borderRadius(12)
      .shadow({ radius: 4, color: 0x10000000, offsetX: 0, offsetY: 2 })

      List({
        space: 12,  // List 项目间距
        initialIndex: 0  // 初始索引
      }) {
        LazyForEach(this.itemGroupArray, (item: TimeTable, index: number) => {
          MyItemGroup({ item: item })
        }, (item: TimeTable, index: number) => `${item.title}-${index}`)
      }
      // 根据官方文档设置完整的 List 属性
      .lanes(2)  // 设置2列布局
      .alignListItem(ListItemAlign.Center)  // 交叉轴居中对齐
      .listDirection(Axis.Vertical)  // 垂直方向
      .scrollBar(BarState.Auto)  // 自动显示滚动条
      .scrollBarColor(0x007DFF)  // 蓝色滚动条
      .scrollBarWidth(6)  // 滚动条宽度
      .edgeEffect(EdgeEffect.Spring)  // 弹簧边缘效果
      .chainAnimation(false)  // 关闭链式动画
      .multiSelectable(false)  // 关闭多选
      .layoutWeight(1)
      .width('100%')
      .backgroundColor(0xF5F5F5)
      .borderRadius(12)
      .padding(8)
      // List 事件处理
      .onScrollFrameBegin((offset: number, state: ScrollState) => {
        console.log(`List scroll: offset=${offset}, state=${state}`);
        return { offsetRemain: offset };
      })
      .onScrollIndex((start: number, end: number, center: number) => {
        console.log(`List scroll index: start=${start}, end=${end}, center=${center}`);
      })
      .onReachStart(() => {
        console.log('List reached start');
      })
      .onReachEnd(() => {
        console.log('List reached end');
      })
      .onScrollStart(() => {
        console.log('List scroll started');
      })
      .onScrollStop(() => {
        console.log('List scroll stopped');
      })

      // 属性说明区域
      Column({ space: 8 }) {
        Text('ListItemGroup 属性配置')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor(0x333333)

        Column({ space: 4 }) {
          Text('• space: 8 - 子组件间距')
            .fontSize(12)
            .fontColor(0x666666)
          Text('• style: ListItemGroupStyle.CARD - 卡片样式')
            .fontSize(12)
            .fontColor(0x666666)
          Text('• childrenMainSize: SPACE_EVENLY - 均匀分布')
            .fontSize(12)
            .fontColor(0x666666)
          Text('• divider: 自定义分割线样式')
            .fontSize(12)
            .fontColor(0x666666)
          Text('• headerComponent/footerComponent: 动态头尾组件')
            .fontSize(12)
            .fontColor(0x666666)
          Text('• swipeAction: 滑动操作（编辑/删除）')
            .fontSize(12)
            .fontColor(0x666666)
          Text('• selectable: 支持选择交互')
            .fontSize(12)
            .fontColor(0x666666)
        }
        .alignItems(HorizontalAlign.Start)
      }
      .width('100%')
      .padding(16)
      .backgroundColor(Color.White)
      .borderRadius(12)
      .shadow({ radius: 4, color: 0x10000000, offsetX: 0, offsetY: 2 })

    }
    .backgroundColor(0xF0F4F8)
    .width('100%')
    .height('100%')
    .padding(16)
  }
}
