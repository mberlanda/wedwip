import './style.css';

export const WEDDING_DATE = new Date('2016-10-01T16:00:00+02:00');

export interface Elapsed {
  years: number;
  days: number;
  hours: number;
  minutes: number;
}

/** Whole years since the wedding, plus the remainder split into days/hours/minutes. */
export function elapsedSince(from: Date, now: Date): Elapsed {
  let years = now.getFullYear() - from.getFullYear();
  const lastAnniversary = anniversaryOf(from, from.getFullYear() + years);
  if (now < lastAnniversary) years -= 1;

  const since = anniversaryOf(from, from.getFullYear() + years).getTime();
  const rest = Math.max(0, now.getTime() - since);
  return {
    years,
    days: Math.floor(rest / 86_400_000),
    hours: Math.floor((rest % 86_400_000) / 3_600_000),
    minutes: Math.floor((rest % 3_600_000) / 60_000),
  };
}

function anniversaryOf(from: Date, year: number): Date {
  const d = new Date(from.getTime());
  d.setFullYear(year);
  return d;
}

function render(now: Date): void {
  const elapsed = elapsedSince(WEDDING_DATE, now);
  for (const [key, value] of Object.entries(elapsed)) {
    const el = document.querySelector(`[data-counter="${key}"]`);
    if (el) el.textContent = String(value);
  }

  const note = document.querySelector<HTMLElement>('[data-anniversary]');
  if (note && elapsed.years >= 10) {
    note.hidden = false;
    note.textContent = 'Buon decimo anniversario! 🥂';
  }
}

render(new Date());
setInterval(() => render(new Date()), 30_000);
