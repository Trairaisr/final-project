export interface RegisterParams {
  username: string;
  name: string;
  lastname: string;
  password: string;
  email: string;
}

export interface VacationParams {
  id:number;
  destination: string;
  description: string;
  image: string;
  startDate: Date;
  endDate: Date; 
  price: number;
}
