import React from 'react';
import { render, screen } from '@testing-library/react';
import App from './App';
import { act } from 'react-dom/test-utils';

test('renders lib.multiply_by_two', () => {
  const setState = jest.fn();
  const useStateSpy = jest.spyOn(React, 'useState');
  useStateSpy.mockImplementation(init => [{multiply_by_two: () => 24}, setState]);
  render(<App />);
  useStateSpy.mockRestore();

  const content = screen.getByText(/3 multiplied by 2 = 24./i);
  expect(content).toBeInTheDocument();
});

test('correctly calls lib.multiply_by_two', async () => {
  return await act(() => { render(<App />); })

  return new Promise(async (resolve, reject) => {
    setTimeout(async () => {
      await new Promise(process.nextTick);
      const content = screen.getByText(/3 multiplied by 2 = 6./i);
      expect(content).toBeInTheDocument();

      resolve();
    }, 1000);
  })
});