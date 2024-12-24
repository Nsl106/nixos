import { Variable, exec } from "astal";

const weatherCommand = [
	"curl",
	"https://api.weatherapi.com/v1/forecast.json?key=50514a8cd61443ceb3b20844240912&q=85086&days=1&aqi=no&alerts=no",
];

export const weather = Variable<any | null>(null).poll(
	60_000,
	weatherCommand,
	(out, prev) => JSON.parse(out),
);
