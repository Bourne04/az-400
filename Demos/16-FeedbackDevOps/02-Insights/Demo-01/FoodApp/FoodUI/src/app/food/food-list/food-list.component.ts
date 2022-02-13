import {
  Component,
  OnInit,
  Input,
  Output,
  EventEmitter,
  SimpleChanges,
} from "@angular/core";
import { FoodItem } from "src/app/food/food.model";
import { MatTableDataSource } from "@angular/material/table";
import { AppInsightsService } from "../../shared/app-insights/app-insights.service";

@Component({
  selector: "app-food-list",
  templateUrl: "./food-list.component.html",
  styleUrls: ["./food-list.component.scss"],
})
export class FoodListComponent implements OnInit {
  constructor(private ai: AppInsightsService) {}

  @Input()
  food: FoodItem[];
  @Output()
  onEditSelected: EventEmitter<FoodItem> = new EventEmitter();
  @Output()
  onDeleteSelected: EventEmitter<FoodItem> = new EventEmitter();
  @Output()
  onAddToCart: EventEmitter<FoodItem> = new EventEmitter();
  @Output()
  onDeleteFromCart: EventEmitter<FoodItem> = new EventEmitter();

  ngOnInit() {}

  ngOnChanges(changes: SimpleChanges) {
    console.log(changes.food.currentValue);
    this.dataSource = new MatTableDataSource(changes.food.currentValue);
  }

  displayedColumns: string[] = [
    "name",
    "price",
    "calories",
    "addItemToCart",
    "removeItemFromCart",
    "deleteItem",
    "editItem",
  ];
  dataSource: MatTableDataSource<FoodItem> = new MatTableDataSource([]);

  applyFilter(filterValue: string) {
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }

  addFood() {
    console.log(this.getNextId());
    this.onEditSelected.emit({
      id: this.getNextId(),
      name: "",
      price: 0,
      calories: 0,
    });
  }

  getNextId(): number {
    return this.food.reduce((acc, f) => (acc = acc > f.id ? acc : f.id), 0) + 1;
  }

  selectFood(p: FoodItem) {
    this.ai.logEvent("food selected", p);
    this.onEditSelected.emit(p);
  }

  deleteFood(p: FoodItem) {
    this.ai.logEvent("food deleted", p);
    this.onDeleteSelected.emit(p);
  }

  addItemToCart(f: FoodItem) {}
}
